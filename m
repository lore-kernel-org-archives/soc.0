Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0CE19D07E
	for <soc@lists.linux.dev>; Thu, 14 May 2026 17:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778780817; cv=none; b=Y1DqoXK57sp/r8T3274jIZv0oM8OCRimESvfuS72SaY8Gam1U5SmtJOXmvvADLgrNtWuhn6dkas5+Mz9aLw8D90dAoZFhQ57FPlr7zBw+NOP3L144gC0R0zN56LNPH1lg4gOST5OxCHnC5n8kBk8eOPKN9vfukR127FlIownlzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778780817; c=relaxed/simple;
	bh=gmvU3BcivNMC9rSfaYcNk10FL3fgp5Bc5fKD7NFaKJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=egNDLmq3yWy9ss9sQjjCtqQh6SV1jyrnPLHmeeDEok3nHVcLVHLKJjgqQcEQmU6zXzKI7AFNhDsERGo005Pjb6yf7lXgaQW4UtMjmaP+kOKZV6ZAkNzw1xaY7TXb0p5h/h5hp5R5Bj3uKqIvkY9TDn+aTOgRQmmCv4MWMKI6Cu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GW8Ee7aP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GW8Ee7aP"
Received: by smtp.kernel.org (Postfix)
	id 77247C2BCB7; Thu, 14 May 2026 17:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDDDEC2BCB3;
	Thu, 14 May 2026 17:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778780817;
	bh=gmvU3BcivNMC9rSfaYcNk10FL3fgp5Bc5fKD7NFaKJw=;
	h=From:To:Cc:Subject:Date:From;
	b=GW8Ee7aPsp01JfvT/PPHTmJ1YZfVk7AWXH9Vi85/gZrPr73eb2osTHKbWjKMnS1Xj
	 RMUDzNJzQ9/hlYN8eiOku0HranClVxJ0Rccz0aGZkMIc4ZDikTfaxQpCcTV2fUocHV
	 JUUpp3WhterK1sxwKYDnuzAomtXGFTH8+0f2ll7pu45ZSWNBoFbP/kDfNq0vx9ht9E
	 Z1hTw05e7jUWY5QT/qCr2iMNE1HPPkEYWIz50du+m5smMaaH6KXQwLhelHlV93AOd8
	 tsCHoIfMI1V6+TZl8qNW9jkjCLkADOCGqxRIUunfwjgbcogNvJ//BqAcN/55sp0b9b
	 qGMxF/TvXfKzg==
From: Alexander Sverdlin <asv@kernel.org>
To: soc@kernel.org
Cc: Alexander Sverdlin <asv@kernel.org>
Subject: [GIT PULL] ep93xx fix for 7.2
Date: Thu, 14 May 2026 19:45:54 +0200
Message-ID: <20260514174556.1678694-1-asv@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear SoC maintainers,

Please pull the following small ep93xx cleanup for 7.2:

The following changes since commit 8bb9429a291964ca7a2244f48a34e02bb862c95d:

  soc: document merges (2026-05-08 15:36:35 +0200)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/asv/linux.git tags/ep93xx-20260514

for you to fetch changes up to 042ea20618bccbe6d80234fa632c7b5803a4a841:

  arm: boot: ep93xx: don't rely on machine_is_*() for removed board files (2026-05-14 15:16:01 +0200)

----------------------------------------------------------------
The patch removes the dependency on <asm/mach-types.h> in the decompressor
for EP93xx-based boards that no longer have legacy board files. This is a
preparatory step for cleaning up a large number of stale entries in
mach-types.

Link: https://lore.kernel.org/all/20260509223820.50347-1-enelsonmoore@gmail.com/
----------------------------------------------------------------
Ethan Nelson-Moore (1):
      arm: boot: ep93xx: don't rely on machine_is_*() for removed board files

 arch/arm/boot/compressed/misc-ep93xx.h | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

--
