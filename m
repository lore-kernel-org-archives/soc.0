Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA8F1F5F6
	for <soc@lists.linux.dev>; Sun,  5 Jan 2025 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736070717; cv=none; b=qFSgcreA7M/EoVI5TLC6CTLDM1GkMmu5dLWXw1sknABjGL63BVlc1aLCupGPhfTXXKdIZANDNvorbULoIRzzuIrrUR1U453dUvU+DyBjOXqqqwtBuZRsvEAu5/+/4eySfGktzB5vvYuolk8SYE/EZgJy0b+qychtnqEArd8qkJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736070717; c=relaxed/simple;
	bh=Yz6V1K3dVhdnxIo5rPnGcMu3KhBIkIWjChRt8K22yIc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pimTVWb8zSAtn6wyTWQH2qN0oRPAVC4jZWoWISk3n4vN4y5/aUIvW3fu6gYha5DpF70vD6PebaBGRcj3Ji6OW29VFX6r+aaMBN/cj/pxiKTtpJUFDYl+SZE7oxNfi0XLWjLgwsYLkPbR8zB1DBRY1Lu/MjVf/aWNbdAFh4yKCvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=CvSpIHcI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="CvSpIHcI"
Received: by smtp.kernel.org (Postfix)
	id 14E3DC4CEE7; Sun,  5 Jan 2025 09:51:57 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.kernel.org (Postfix) with ESMTP id 8D5C0C4CEE0;
	Sun,  5 Jan 2025 09:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D5C0C4CEE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=AvaoX
	9cLj1j/PbPbkHelZ5srVkW5zdoaCOit3aZBk9c=; b=CvSpIHcIMM/+kmwy5nAMk
	pre3HBNRo6x2XdEde1KmPj9BjQgf1b7GpOzbPkAxruhyrY8Ay8AGFSlVLS8/6hrY
	SM6SgZr26f8eJ7l+ZoGu96t6PNi8Y6UHaGe0qhHaV/Zz31hnrNh8pzbRKfVEZEkx
	CVdUFCYQ0X2Gm3R/wuoVDM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXGWwuVnpnZZRPBg--.62165S3;
	Sun, 05 Jan 2025 17:51:44 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] i.MX dt-bindings change for 6.14
Date: Sun,  5 Jan 2025 17:51:35 +0800
Message-Id: <20250105095139.714590-2-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250105095139.714590-1-shawnguo2@yeah.net>
References: <20250105095139.714590-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgBXGWwuVnpnZZRPBg--.62165S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryxXry8Jw4ftr4UArW7CFg_yoWfWwb_Ga
	4xA3WUJrWUZF1UtryDGr1xtr15Jw17JF1UZ3W5Jr47Ar17t3s8JryktrWfXF18XFs8JFsx
	AF4kJw1kXr47AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8Tq2tUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAhnLZWd6LaNicgAAs2

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.14

for you to fetch changes up to 9723142eae655bcf4d26feb6893acfa03e011587:

  dt-bindings: arm: fsl: Add ABB SoM and carrier (2024-12-09 16:35:30 +0800)

----------------------------------------------------------------
i.MX dt-bindings change for 6.14:

- Add compatibles for i.MX8MP based SoM and carrier from ABB

----------------------------------------------------------------
Heiko Schocher (1):
      dt-bindings: arm: fsl: Add ABB SoM and carrier

 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

