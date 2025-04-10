package com.kuha.chat.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.kuha.chat.dto.MessageDTO;
import com.kuha.chat.dto.MessageGroupDTO;
import com.kuha.chat.service.MessageService;
import com.kuha.chat.service.UserAndGroupService;

@RestController
@CrossOrigin
public class MessageControllers {
    @Autowired
    MessageService messageService;
    
    @Autowired
    UserAndGroupService userAndGroupService;

    @MessageMapping("/chat/{to}")
    public void sendMessagePersonal(@DestinationVariable String to, MessageDTO message){
        messageService.sendMessage(to, message);
    }

    @GetMapping("Listmessage/{from}/{to}")
    public List<Map<String, Object>> getListMessageChat(@PathVariable("from") Integer from, @PathVariable("to") Integer to){
        return messageService.getListMessage(from, to);
    }

    @MessageMapping("/chat/group/{to}")
    public void sendMessageToGroup(@DestinationVariable Integer to, MessageGroupDTO message){
        messageService.sendMessageGroup(to, message);
    }

    @GetMapping("listmessage/group/{groupid}")
    public List<Map<String, Object>> getListMessageGroupChat(@PathVariable("groupid") Integer groupid){
        return messageService.getListMessageGroups(groupid);
    }

    @GetMapping("/fetchAllUsers/{myId}")
    public List<Map<String,Object>> fetchAll(@PathVariable("myId") String myId){
        return userAndGroupService.fetchAll(myId);
    }

    @GetMapping("/fetchAllGroups/{groupid}")
    public List<Map<String,Object>> fetchAllGroup(@PathVariable("gorupid") String groupId){
        return userAndGroupService.fetchAllGroup(groupId);
    }
}
