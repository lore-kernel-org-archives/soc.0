Return-Path: <SRS0=6JJP=QD=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25E9CD4F22
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 00:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9BA6CC4CEC3; Thu,  5 Sep 2024 00:11:26 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CE7E0C4CEC2
	for <soc@kernel.org>; Thu,  5 Sep 2024 00:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CE7E0C4CEC2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-717594b4ce7so172935b3a.0
        for <soc@kernel.org>; Wed, 04 Sep 2024 17:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725495083; x=1726099883; darn=kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WBb2m4LRqIVhYecRL8ia2k0mOHcNoJOjR2lFU/Vhyqs=;
        b=kEP8moK+XCWZCp3d+pU/8Y/47giXNDOK/xt3nMXNG68ekLioyohLBjxgP+pqvxRa+N
         xgjFNfARorRPXP//gHRja6+HcIxAFTWqEKZir47I9f/s9eRDL4ExM1BJxuUoxWRdTcmI
         QKkB7O5Y/mEVDdlQetiQAP2xVWA4oPwP2Wo/BluEMs8PqY5ErAZeywpKxdN2lnsy9Zli
         4qYOoeI2g/DaVnIwh64xjz226MpHvFmwNcogay1U/axybVn77Hv+7rfvNKMQsqLu4Jv2
         eOdNYL6q69rcFK4AFfGdlsvW+uDBieWPbg7tL1tA+GQCeG8tK6kfGZaI3uTTBTE193bo
         +2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725495083; x=1726099883;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WBb2m4LRqIVhYecRL8ia2k0mOHcNoJOjR2lFU/Vhyqs=;
        b=efsxdN9EtWtY14JISu5HNtDdPDfH/jJS2PEngl2BdMOuMWr058hWFagjDPHNqVN1kY
         zzZ1l522lqYTySZnk+/OEfYyQYfp2hzaHb5NFi81U4k3FEE+AFsJj9+eckIrp/kIY7RP
         ZoUP/KpowWC3WFP+SYL5PyK4QkAkFGrKlUk0QK7nwk6oBQOIum5jFzOi2jAv0Rf0/Dco
         vZz9siDUxCgMu0TEqLVdOuAU4fXL3AWqUQggGax9Fq0Mbz1AGYLRALkOfYNvei9B5d9Z
         ehrdaFehT5ujwGfTIN7lD4pCmSDyZVN0i7bP0lqzMg7GaogCMS2JQ46BZFMzROBkF50P
         YbKw==
X-Gm-Message-State: AOJu0Yx/iQAzTRdYtHYQAjnUGkpMe0hKlVzesZZ72jp3TjFxM2ozISG4
	auo+T++/AVMOHiBeGp9TEmf2CN9PLAjft1J+9AfSuOPK1NAAUo+gC+jpHihEl+jSj55R7r8zu/W
	e
X-Google-Smtp-Source: AGHT+IEispmsRDT/jVl+Mi6E0JuyUc+QsYEaQ8/O5NzZYXN3oQwk+xP3FkJL7y6A7+ov8gEQTBNBJg==
X-Received: by 2002:a05:6a00:2e8f:b0:705:c0a1:61c9 with SMTP id d2e1a72fcca58-715dfb127c2mr26216960b3a.9.1725495082771;
        Wed, 04 Sep 2024 17:11:22 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbdadd48sm1903769a12.79.2024.09.04.17.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 17:11:22 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org
Subject: [GIT PULL] ARM: OMAP2+: misc driver updates for v6.12
Date: Wed, 04 Sep 2024 17:11:22 -0700
Message-ID: <7hcyljarit.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.12/drivers-signed

for you to fetch changes up to 9aee8262445d185960431e972e2d997e6aba3de0:

  ARM: OMAP2+: Remove obsoleted declaration for gpmc_onenand_init (2024-08-30 10:57:24 -0700)

----------------------------------------------------------------
ARM: OMAP2+: misc driver updates for v6.12

----------------------------------------------------------------
Dhruva Gole (1):
      bus: ti-sysc: Remove excess struct member 'disable_on_idle' description

Gaosheng Cui (1):
      ARM: OMAP2+: Remove obsoleted declaration for gpmc_onenand_init

Rob Herring (Arm) (1):
      bus: ti-sysc: Use of_property_present()

 drivers/bus/ti-sysc.c     |  7 ++-----
 include/linux/omap-gpmc.h | 10 ----------
 2 files changed, 2 insertions(+), 15 deletions(-)
