Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D47183CA5
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 16:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728664800; cv=none; b=Y6/NqjUSsGFvJGP1RCFu/Ls+IF76Piuz7QArGbzKal+HMOY8r5Xap1tYwpEsDS5F94WS3+L7Hvy3uaNGuS3qKDCEVFLvmVzPSGEIJcJvGb4G6YDmIL0kw2ur/umI2qog3Un4W9A9GMTxsZlhBBiUupDrsPyw7HoozPUdbPevqLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728664800; c=relaxed/simple;
	bh=gUqCGTOrW5J6kJqLgXlfQwlRZc57OcmafMNeztF/PKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RVh3SKn8X7NKPWZd8LEqMGVOEWma2h9ifRS0aPQFxr/T4PL9TWVorQVvHVQOoVYReXAAUGSjNjnXmArkFdFvyO3l2JVBfVqjTKFhSpCKyD4etn/cd9s4PH7YR1Y+kjTSpbRyqmfQF3NThCMPlXW6dsKB34WgKntmmA+ArGGc4k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZIMiPZwj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZIMiPZwj"
Received: by smtp.kernel.org (Postfix)
	id 1906DC4AF09; Fri, 11 Oct 2024 16:40:00 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF709C4CED0;
	Fri, 11 Oct 2024 16:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF709C4CED0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57859FF809;
	Fri, 11 Oct 2024 16:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728664789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=VzMpMzlj6+bE25cKmeC7xJuDA+veVv6vu4YkX/UNBJY=;
	b=ZIMiPZwjV5350c8B++pXe0nsPbE7pqRAKYT7kBhfEZ82aeNu8gPhjkeDiQZdXOcNvocwaO
	AZ7kBRcAyYXoMkLu0Ua0BT+xf7O7ORPFzOSYGK53751qvL5T+GM+0WYNM5sE2unF9pYs5z
	GH6nAbXPybqUFZqD3xPQFnqra/JJ7ZYCj9idHfxBoxWuySDmycuW1samp9SXYCYWK0Krh9
	ajwQ9wk6aWvOTjHzPjcMvI7GilKktgDvqPqsHh3k1g5cigobHEEiXvs5PvOx8LL1k9zUw4
	ZSe0FYHo50rdLQWBF75bmPda0U0oeO+5iW8+9T15Dus4wbglI+F7FwNkf6wzvg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v6.12 (#1)
Date: Fri, 11 Oct 2024 18:39:47 +0200
Message-ID: <87ldyud25o.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for fixes for mvebu for v6.12.

Gregory

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-fixes-6.12-1

for you to fetch changes up to 841dd5b122b4b8080ede69c5f72fd6057da43f8a:

  arm64: dts: marvell: cn9130-sr-som: fix cp0 mdio pin numbers (2024-10-07 10:05:35 +0200)

----------------------------------------------------------------
mvebu fixes for 6.12 (part 1)

Fix cp0 mdio pin numbers on SolidRun CN9130 SoM

----------------------------------------------------------------
Josua Mayer (1):
      arm64: dts: marvell: cn9130-sr-som: fix cp0 mdio pin numbers

 arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
