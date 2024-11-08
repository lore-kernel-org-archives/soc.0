Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F211D0F47
	for <soc@lists.linux.dev>; Fri,  8 Nov 2024 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058480; cv=none; b=k+8HAW3wxZLg/eAY2XYqA0HS1vr3JBOo+kdSKqprdCnA/YeMFk2FYlekdYDbY9D7S8JCkiiGO6EDy4HA5xpHuLRlFByAJsttaAYSTC2CSG6y8jCpkWVyGtmwxMEwEtYkiWmMFOf46ftulkiRTrdHhbCT0Qszgg3XzcpbxYSXOnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058480; c=relaxed/simple;
	bh=bTUVwJ/wQ5hg4VMM9HlLKvqi/tzDn/sbsiBRIUWaeIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SjgOsRWy0MUsaljV2OpySG3sGc2Thz8PSXypFrbA1HxByaRFzL9RYTFtrOx46nf6OFfuGCNEmyh3kYt/c1A2L7cZa7KB/rc4KGpf6GUK1o5ZWAoPxCupfEuzEa0LNUSk1PiWTAQdiPJOnQ9coC0PnyNsoO5ce4lWUsuGKnh4S7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZLZn9Z7i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZLZn9Z7i"
Received: by smtp.kernel.org (Postfix)
	id 524CCC4CECE; Fri,  8 Nov 2024 09:34:40 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 23D5FC4CED2;
	Fri,  8 Nov 2024 09:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 23D5FC4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 828A31BF204;
	Fri,  8 Nov 2024 09:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731058476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XntAqJuL0NV1KX+kzLWD7QKp8DgAkKe6PX7aJGRi2j8=;
	b=ZLZn9Z7ihEzf16221kXvKJ2zd5NJ3tBbw7EC5QnHf7DNoRvy5thrU1+/c4aHyf8iGesIAs
	tkNEMMMSj/ENr8Q7VriTXzXFjwGSWnrINp7CQhjwhj3xRuAzmr5CvSgZODWdLbn57CoU3R
	U30tffKL+Nqn0/FxCVDB/CERWCEytSkqHK1kGXrPmqb0Oi3KamosSlLwSsGJCO4rGzqDJ3
	geJKqxdbeI2Mm7IqwOeiNcKHabLNKruzYfsYnYNNJhG6duJ7caYXfQwtmZzsKcxB223URV
	p0UXXquom9oeKxX+adqQt2YVELRxTFU04AGAwGKv/SfE5owjoBewt4YavoMF7A==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v6.13 (#1)
Date: Fri, 08 Nov 2024 10:34:35 +0100
Message-ID: <87bjyq83x0.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for dt for mvebu for v6.13.

Gregory

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-6.13-1

for you to fetch changes up to 68bc6a71f56875a7dbde4f44aa4404c214651e1c:

  ARM: dts: turris-omnia: Add global LED brightness change interrupt (2024-=
11-04 17:00:41 +0100)

----------------------------------------------------------------
mvebu dt for 6.13 (part 1)

turris-omnia: prepare device tree for LED brightness change detection
kirkwood: fix at24 EEPROM node name

----------------------------------------------------------------
Marek Beh=C3=BAn (1):
      ARM: dts: turris-omnia: Add global LED brightness change interrupt

Rob Herring (Arm) (1):
      ARM: dts: marvell: kirkwood: Fix at24 EEPROM node name

 arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts | 1 +
 arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
