SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `websocket-chatapp`
--

-- --------------------------------------------------------

--
-- Structure the tabel `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Structure the tabel `group_members`
--

CREATE TABLE `group_members` (
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure the tabel `group_messages`
--

CREATE TABLE `group_messages` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `messages` varchar(255) DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure the tabel `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `message_text` varchar(255) DEFAULT NULL,
  `message_from` int(11) DEFAULT NULL,
  `message_to` int(11) DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure the tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes of tabel `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes of tabel `group_members`
--
ALTER TABLE `group_members`
  ADD KEY `group_id` (`group_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes of tabel `group_messages`
--
ALTER TABLE `group_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes of tabel `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_from` (`message_from`),
  ADD KEY `message_to` (`message_to`);

--
-- Indexes of tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT intotabel `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT into tabel `group_messages`
--
ALTER TABLE `group_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT into tabel `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT into tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- FK into tabel `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `group_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- FK intotabel `group_messages`
--
ALTER TABLE `group_messages`
  ADD CONSTRAINT `group_messages_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `group_messages_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- FK into tabel `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`message_from`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`message_to`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
