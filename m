Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B3E1C84C7
	for <soc@lists.linux.dev>; Mon, 19 May 2025 02:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747620849; cv=none; b=VLH7GL5St9ws/VJuCJZNC2QFZztZyPK6gq0ayXjvCnSXlvr3SngL04EK+9e6i7F9AMyMwiTAo0pVBBvdb1BeceGnG94ggsGC4522T9XIu0hKg5I0YvP/5531XgGzpeKswcvP4jZ5nwxfYZGqGf13FlJ9kQjEBQpUFgmSbWzx8fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747620849; c=relaxed/simple;
	bh=1pS50iK4RPQaoO5iX+B9GdPXRq/bGTaOFunc8nWDAQ0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BQwSSieJoBkCLgiT601lMRfv6p0KI1/xpovtyToZIP+EYdcGQeudJrUabXYpv50uJ7QD5aV4oiMQ+Pkacv0E0F8yzHwoCTKJk9HIG40bTxtG4AVA8TnJssspEURV6YXIt7SZre+AMaTE262zTDeGk35k303xq11xtajBXL+By1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b=PT2pZEG9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="PT2pZEG9"
Received: by smtp.kernel.org (Postfix)
	id 235F8C4CEEB; Mon, 19 May 2025 02:14:09 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E825DC4CEE7
	for <soc@kernel.org>; Mon, 19 May 2025 02:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E825DC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso725754566b.0
        for <soc@kernel.org>; Sun, 18 May 2025 19:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1747620845; x=1748225645; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V9KiaqIE2kZ8tUorevF8S25fszFbrGeBV5a4/fMO0ww=;
        b=PT2pZEG9dKYyI4pKQE8tJ8U1qBsw92EgoIKu0f6fynZ1P3/HVr1yQZZhwCcTQAPCKn
         OAI94J3CgM27ATp8hLgVMnI8bHe+rnQaQwkeDN1nYyNEz0wkkHU4R8NW81v2gLAMwXUg
         LrHhYW9YNOxkTKZVrxRHTdOUkAWXOjod33+5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747620845; x=1748225645;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9KiaqIE2kZ8tUorevF8S25fszFbrGeBV5a4/fMO0ww=;
        b=mPPAIvirsfLWEm0pyISbz1Owc8p12CNvVQ5gN+q8gKU+btJmGUaTGdjQGSk22e9qJP
         kWOCLH8duyR+x8wYjD1MQeu4sCZfGNuNeKK4sVsW67hv8I34dcCCE+pw9LcnIIw/MOKc
         MuYAK9zbhc20GvBN/uuGXt0P+5sMx9WDZ5UnvxnC9RXowFUt92s4ltU8nkAp+uhp00+s
         jVwz83Q9i2orVHT+yU7hFMq1/bUhHzEm+tz7m7IEjcONs25pWE/5HSCudnGaGDg9kw3A
         JfaIlWUsuKF9UYhfQ0xEXeFprALIkNrlnm8jGmh9KRLkuKw0xJGCga2DPgXesrXVRpmH
         nkqA==
X-Gm-Message-State: AOJu0YyF5WQZOIQwo838MpOtutmZFCcAv50hYLRyvp+iV7oJBFEzOETR
	Yr5i3uslMUL4ZhXsFo4lkcvBL/BCdCv5aTv94oFhS1t5QQuG9O/tlK21jdN6w/jsc3rduN9wzQg
	jcyT2Cm0ctH+RMgXe7eMhRaD9E70ak3Ghvla34bY=
X-Gm-Gg: ASbGncvjDPg0+WPLYuosCaXlTSH3zUmGt41K+YXzbdg9Po4ultV9Ihr9l3o6jgciUlT
	PxT6W2Gvyq0Rys/Ath5sy4Vi5wJpktgjGq4n7dUQV3woCNOhi8UcvC65RUWg/kDdD77YNtJ85kR
	9863PIH5+DZYNRtKnZWFtu9KOgbLvpDfu4
X-Google-Smtp-Source: AGHT+IHcXZRPApdD/mdAKFv4vQL1CkTYBUUPaeCGWfYuku4UTJAUPIBrCltTcsJicRUaDh2+x3T816AElhch/rnZxT4=
X-Received: by 2002:a17:907:3f1c:b0:ad5:5b2e:655b with SMTP id
 a640c23a62f3a-ad55b2e7968mr400215466b.25.1747620845390; Sun, 18 May 2025
 19:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 May 2025 11:43:53 +0930
X-Gm-Features: AX0GCFv8wkXV3Qs9a1kPtAmOB7n3fcMkhgCOuZ6hZZjhSaUdY799d7N4FvECxgg
Message-ID: <CACPK8Xe=f_hNNWUGL670x4-OeKgDB+2P+mxp5BaTLW==T5jE_A@mail.gmail.com>
Subject: [GIT PULL] ARM: nuvoton: soc changes for 6.14
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"

Hello Arnd,

Here's the Nuvoton 32 bit arm pull request for 6.16. Andrew has prepared the
patches and created the tag, so all credit goes to him.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc
tags/nuvoton-arm-6.16-devicetree

for you to fetch changes up to 7efb8b92165fea427a03df87e14d519b8acf57f8:

  ARM: dts: nuvoton: Add MMC Nodes (2025-04-08 11:29:38 +0930)

----------------------------------------------------------------
Nuvoton ARM devicetree updates for v6.16

- MMC, OHCI, UDC and EDAC blocks added to the NPCM7XX DTSI
- Fixes for GPIO hog names in the NPCM730 and RunBMC Olympus platforms

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: nuvoton: Align GPIO hog name with bindings

William A. Kennington III (4):
      ARM: dts: nuvoton: Add EDAC node
      ARM: dts: nuvoton: Add UDC nodes
      ARM: dts: nuvoton: Add OHCI node
      ARM: dts: nuvoton: Add MMC Nodes

 .../boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi   | 108 +++++++++++++++++++
 arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts  |  12 +--
 .../dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts | 120 ++++++++++-----------
 arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi     |  65 +++++++++++
 4 files changed, 239 insertions(+), 66 deletions(-)
