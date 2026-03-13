Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAC53644A6
	for <soc@lists.linux.dev>; Fri, 13 Mar 2026 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417189; cv=none; b=Qu+ysHCFBOlTeHnya5uaFh8vn25PpROai1Xi/snXhJ3TBAXlZjowVNTUMVHKdhXYxGPXz1ZAlhXKoVvV1OvrNS4wye8tDiC2T/WNatyuwsosWzP+R5rdnCqaypIH2vMSqswB9VVCCEQHb0g9AXnHz8G0nh0zF4c248w5mnGCL4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417189; c=relaxed/simple;
	bh=r29tU8xDLvVMsZVwp46q3LLH/z5KtCI/N1KjFypHSK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BuHgfhX2JxWCbLFaw59FRUjI39IEoDUVdvwfJhra5GtGp7w6yU5DdOl3+u51i0tqDCBnwYaoN9ZSSqni+FXo2Hc4yizLXhspiH+VUdAhA1gcWSz2Yf3ejdMBuIlifMjgA4OnVGJ6CG4J5w2NHdGFZL05jQVD+VVLstdEALUppLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=P+tQK618; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="P+tQK618"
Received: by smtp.kernel.org (Postfix)
	id 6E886C2BC87; Fri, 13 Mar 2026 15:53:08 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58A25C19421;
	Fri, 13 Mar 2026 15:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 58A25C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CA671C4270D;
	Fri, 13 Mar 2026 15:53:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 895A460027;
	Fri, 13 Mar 2026 15:53:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A90210369BC8;
	Fri, 13 Mar 2026 16:53:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773417185; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=RhQbr3RZrekdSceZwHhpVS9NZfOuZeEVVOMiQ+CpsyM=;
	b=P+tQK618eO5lJVH3N0dL48nTSc7MBge8GNqkERIJBdMoCtJGV9wc7UBW4TKR7y3jMUirkd
	35IsXqCg1HMg7aOXHWarq4rnpNSVrN5/f9LNp3c3bXYXrYYhb6t3iE2ygAEDNmZh0hZR5c
	BhFpkmKwLeoKIZt19eudIWtL8xtYlDDk68s+h0SFkKI0cPDIfxoTBjwSUW8pp1VsvN8G3w
	2v+EdxyCas8LaGjhtaJwlZ4iUoopxv98SvmSRs+Reosl+YzP29LNa975Px9aNK09M6CA0p
	ICOYZEkoldnRsGYQWs4BbEBGmyeJNkCAjQPmf/9Nl/JBGATvLEX0fs0jikFTFQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v7.0 (#1)
Date: Fri, 13 Mar 2026 16:53:03 +0100
Message-ID: <87sea3680w.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Here is the first pull request for fixes for mvebu for v7.0.

Gregory

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-fixes-7.0-1

for you to fetch changes up to edb7efa767da8bb82d724b85178be251ec4e060e:

  dt-bindings: arm64: add Marvell 7k COMe boards (2026-03-13 16:41:11 +0100)

----------------------------------------------------------------
mvebu fixes for 7.0 (part 1)

- Add bindings to validate the device tree that has already been merged.

----------------------------------------------------------------
Elad Nachman (1):
      dt-bindings: arm64: add Marvell 7k COMe boards

 .../devicetree/bindings/arm/marvell/armada-7k-8k.yaml         | 11 +++++++=
++++
 1 file changed, 11 insertions(+)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
