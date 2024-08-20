Return-Path: <SRS0=ip86=PT=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A01FC3DA4A
	for <soc@archiver.kernel.org>; Tue, 20 Aug 2024 22:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 029F7C4AF15; Tue, 20 Aug 2024 22:03:13 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4BC06C4AF10
	for <soc@kernel.org>; Tue, 20 Aug 2024 21:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4BC06C4AF10
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71423273c62so158557b3a.0
        for <soc@kernel.org>; Tue, 20 Aug 2024 14:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724191128; x=1724795928; darn=kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QEgGWQlUSnnU2Zps1tcbs1WwAWKn9iZ2WAjfctmM1R0=;
        b=yW0Edh+FBDyWAEuTtWVdUZPHf9tuHAhjyK/PujetE4yj7GX6EfCXhHPdkZXxpTzczZ
         TWx/uBu4/ymz/ay4qlfhErfncXBNkQAnnHE/6xdX6IDj/1QKDpzq+iwEBshUVBUWaKD7
         K1YMUVLGJiOKJHbk9Bi8EvECLDg++hcSAkpbMwaZomqfuTL8gbhsA7GQvt3Toi7EEnmR
         pqsOWrbiU5lyU2yBkuK1i0pE8PzngSjV90XSnye/8z4XbjE03gn03RbCBI7dbRNV9haC
         ByCG7gcfGgO9zXZk9hyXImgBlX17f01EHHWx35F2QStB3hkuXI1Mf9AWIvRI0EF15iM7
         HO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724191128; x=1724795928;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QEgGWQlUSnnU2Zps1tcbs1WwAWKn9iZ2WAjfctmM1R0=;
        b=prToQ/BGtQ6Qk3OqbuxqopuLRabV2jQlv0IieRzKN6Tn7SboJe8lkEaaU2UJyoBE8Q
         7BYjesL5E063BYFtKbrp2M/fd76qTsj4yJKcWCNLG+ZLIlEy0dhhvp8TrDSPYBirghsN
         9oR40O7cahEmm8WX5kzKNEbUJLTMxCiVFiqqOnmvByqdqWPtabAq5Vc0SL7uG3wWQHmc
         wy1breTMaEbDR2a/Y3ccBj5vAa88/+8XpL/+5CebqetLg+/d+U5YNpFJMz8L7JlrcMX4
         T3c41V1bqU9f+LrVarjaFqXfzjatPP96w+LG5P29ZwtMmo1Xhan5MFPLO3aJlgyDRxSk
         Oxhw==
X-Gm-Message-State: AOJu0YzyUPlRLmGyzDDJmzwmo0oIdQ3HnrP58FJL67VtQF2m/YPf74hX
	QJt8GtwvIo5QTybcPfWd9TSf8GLeOuC+FiWY4H/vBanr09Q9nYM55x/nVFej9Sp2tfpVBu6p1zx
	q
X-Google-Smtp-Source: AGHT+IHxgAde67vviUGkH8iD44TRlisQATJTZybthdi38Y4uYu1e7xRdwxNjGvFMVp0/Ry8T8TQN8g==
X-Received: by 2002:a05:6a20:b598:b0:1c6:b0cc:c50f with SMTP id adf61e73a8af0-1cad8162296mr801207637.25.1724191127576;
        Tue, 20 Aug 2024 14:58:47 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71420c8f8fdsm341634b3a.146.2024.08.20.14.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 14:58:46 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: [GIT PULL] OMAP fixes for v6.11-rc
Date: Tue, 20 Aug 2024 14:58:46 -0700
Message-ID: <7h4j7eyhyh.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

As discussed here[1], I'll be stepping in to help support on the legacy
OMAP devices, so here's a first pull from me with a fix for the v6.11-rc
cycle.

Please pull,

Kevin

[1] https://lore.kernel.org/all/20240709135930.3405-1-tony@atomide.com/




The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.11/fixes-signed

for you to fetch changes up to 5062d9c0cbbc202e495e9b20f147f64ef5cc2897:

  ARM: dts: omap3-n900: correct the accelerometer orientation (2024-08-05 11:02:39 -0700)

----------------------------------------------------------------
OMAP fixes for v6.11-rc

- omap3-n900: fix accelerometer orientation

----------------------------------------------------------------
Sicelo A. Mhlongo (1):
      ARM: dts: omap3-n900: correct the accelerometer orientation

 arch/arm/boot/dts/ti/omap/omap3-n900.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
