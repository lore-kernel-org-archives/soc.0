Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794627966;
	b=1mTlxbRK+Ro9QeqQUV+2HaBVfg7tQxL/UkP9OqyyTZqVjSrg92kJ/hGmuHwk86tFKyqy
	 ijSGhtFS9n2bYTOhxkOzn9E3JJe5BoMYuq1/tYKnXS0kUkrUGSNqMSINQMbQ9EVlojczo
	 tbCA+8PmwhGy5fRQ+K1oLoQIpSZl58u3xz1UJgPZsylyO8kxIAX2BwYDjDEmVZQyzyOPr
	 vUAHlq/cmIL8NrjxrDK3DTj10bIX30sYIhERNAUGQeBIv1EL6y8bwxisyXx249uXIGj8u
	 n1Rz8IYqIF5vWYtiV1Ca837lw6MCuGeBbDkwYwYVB1NslndASRwJhpenJhwEteamAUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627966;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:DKIM-Signature:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=YcrG+QHKLRQuEyjJS7Of5R85aQNfVdEJbdaiVqqtdpg=;
	b=UkZBgpCKICSHPg2fsrK3Wvf5Rb2FFPcM27pw0OzzCIQxkJ//SWP2odZOgfslORL4Sb2z
	 7jB1k/RLQqTue2EaatGARmdMiCXAJ2P3iVkHDp3zogY0MfPVAYVP2Gd60mUecBEnFX/Ns
	 r/SCy7Z64am1m2C3u5/nD2CaXJD/sFMvpu91/H77lJltGACa4xpPZcIXPl4rxsqcRkkFZ
	 Y0JY9+memAWjn49vQM0KLWESucGjE70lyHBccpQLU0lQPTg1zG0jJXHvrB0EOhLcklOwE
	 IBZieCiGnTI3FHTSJdUF+gvxqGGr7EY+FAqi+T6/RWLXBLFH6RhvoaOMRE9DpwG/pZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JsyrbuLo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664C9606A334
	for <soc@lists.linux.dev>; Sat, 14 Nov 2026 03:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JsyrbuLo
Received: by smtp.kernel.org (Postfix)
	id 002701F000C6; Sat, 14 Nov 2026 03:46:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.214.225
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794627965;
	b=eOkqesPUaSmT9nAuNKFCy0y0Ymro14TX6Dt+mKSuMUDulnwNncxL7z3ERG3bPB3LxBm+
	 sle7GVyDF1EiNylUL4txbR8FWqunAok6nWjNxbH/67mNyIdBOUiJ+ck5EEbASnbdS31P8
	 KC26efKhN4ylZw0BjHFKGIP5xY0I+OW/vo67sZI+ozYXNFLh34iW63KodxFqNT/Lb14pl
	 apcEs6ilJeXC38tsBoxrSbHIVN0jIaJKKvSR+vRr1uzy8raU2ayOU/1LQuCgPtaOP29BM
	 fBvEGMvX0yv6LZWix0gfTz6GU+JBh0uwYVBXwHhlUJuVvKpaFEcIJvPzFXP5D1wzX+Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794627965;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=YcrG+QHKLRQuEyjJS7Of5R85aQNfVdEJbdaiVqqtdpg=;
	b=F8lPdfj4tpwWqS2NbDi/cbkMR9sVuEW+i0GUhfvFnl339heqBGyIsYuK9ta3yGXMlb4d
	 1dgExdUn+oGvhsIWYJPILUGYcAguqnCNHMmNXQH4yWqEhecwr06cQkkDK5tapJMriTOXy
	 wWGH207YFfG2pdH88ybG73ydNcOZHv2RK9LUs/gUutetgNPYGP45YaJi/CvdrbT0L3pAU
	 Q3fLDE/A4n5apUBG1KU69YSipMpfPAsiwdudKNFD+BXpw3oTM4CZ5TsqkVgaZ2jdOw+1o
	 ZZzNMypdQ1N44CDKlCttYGR5yR0H0fNrz/d/POLziP4YcifsfrbS5zfqts1zxOvtfuQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JsyrbuLo;
	dmarc=fail header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	arc=none smtp.remote-ip=209.85.214.225
Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 455B81F000C4
	for <soc@kernel.org>; Sat, 14 Nov 2026 03:46:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JsyrbuLo
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 455B81F000C4
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2ede7cb02daso19484345ad.1
        for <soc@kernel.org>; Fri, 13 Nov 2026 19:46:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627965; x=1795232765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YcrG+QHKLRQuEyjJS7Of5R85aQNfVdEJbdaiVqqtdpg=;
        b=CdNAIlUx/Zi6A8DEk9VTdQkv1KFCuXomPxmiF/xXvGBu2vW93fIf4vjkIVllsDI9hs
         e8xp788qy+JFgt0D7c5/wpQdTVbC+AI38PELcIRiZmMqEdvOUYTG/9+GF3rF2p8gxWLO
         4yAqkpyOkpiMMFv8+nHubvr7OTbdOUN/NUcbJJrfBDmVDHUrRfrwi1itlGAtf8dYbnHe
         wHdxyN18EF4ctTFQHPY64vYZl4xeDR8eYddHketzwrEEtI/5PcsF7hm13h0MYQUmlhVx
         0zhGGA4rLEx7x9NaA29mvvDTlzDCbDxhtAUPrp39TvZ5VU2PXbwjdfgiKJxBjQrZnFtL
         JCew==
X-Gm-Message-State: APuU4Z+yI+YxuoBWJSITfnNGGPf1QRvfH+UhQMB8D+WnMiMhQVN/5C8F
	IJ5pmUW7P02htTbKJzLxcWmwLafTtne5UxweDUW/JNO5gaa9vUuYP/fVscv1p56zgZMIq1xaKi8
	EzGzL4Db+JVB6/VomTXgoJ6UA/PkelUdXX3NwtfxygQQIjwzYhUwxVIA4jb6g/hHo6klCzm9Gax
	hVdw+y0q+kHOTBLunKf0DmefEfkhapLg2t1ojE07hIJt9QjKB52bT9uIIN5O0vyAEOJ7SJqpuh2
	/yWDg==
X-Gm-Gg: AYBFou0gYVzYrLFndUOyB2StoTFi7LvzduGzbarKxZ1/zrm9D/zQAqa5F73097HMrsS
	Q5JWZSBpBfgURDAXN4P9sLjWuJc1sLM0DOZryR20JdCM8HOqcy+ecxuQwwAK2d7LXgkPQtUQmxP
	Q+Z790jdyLKZaweL+nhYnqANTbTN8Sr1DP+yxv07+u5igatVwug2v/kLp7w0k/CzaugiEHSOcqS
	eqprF6275IvdWOn0VlUNKkdxr58PaKxMfaLKs3kVEIRQt1K4QJiBHSLhfxNe+2Tfbf5r7TFcXt8
	bmMtgo0S0w8E+9DktMIhhrjbwomiTSOJhF44yFP7ucqjlAb4TvhLBWGMkUrJW04GtvfUg6efp+B
	1W/I2TdgPjrqhlNWZxzMz8qlu7uKKX1k9GAxGHmVXm5BuuSjbYtTfsNToBxref7JT7i14wbVxuy
	+UZBD3ndzcmpjRteneWY4W6hhIejXJ/c60AQaNsLsq
X-Received: by 2002:a17:902:cf05:b0:2e8:81e2:1d42 with SMTP id d9443c01a7336-2ee0dec63cemr33301885ad.39.1794627964373;
        Fri, 13 Nov 2026 19:46:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ee0fa3d17fsm1907485ad.54.2026.11.13.19.46.03
        for <soc@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:46:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ec0ed4af9so39955366d6.1
        for <soc@kernel.org>; Fri, 13 Nov 2026 19:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627963; x=1795232763; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcrG+QHKLRQuEyjJS7Of5R85aQNfVdEJbdaiVqqtdpg=;
        b=JsyrbuLoQYVNRq9lg9ilFXA16W5qAbTJqJAbxFWfPAJvlG7iROGTqFQxRm8LWpfFHy
         BWT99mepgShgKFvXUAzyJZ+rLMxvo79qYgXKu/QoTlIJDebFrMqAfsocZAeVnEE8sUsE
         XmgWXkYIvHC2A8Dx5Ie+x1flXHjDmtY4fqinE=
X-Received: by 2002:a05:6214:300d:b0:91e:b8aa:69de with SMTP id 6a1803df08f44-91f13a9f655mr126922396d6.36.1794627962887;
        Fri, 13 Nov 2026 19:46:02 -0800 (PST)
X-Received: by 2002:a05:6214:300d:b0:91e:b8aa:69de with SMTP id 6a1803df08f44-91f13a9f655mr126922136d6.36.1794627962425;
        Fri, 13 Nov 2026 19:46:02 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d453casm34694466d6.10.2026.11.13.19.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:46:01 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Martin Wetterwald <martin@wetterwald.eu>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Gaston Gonzalez # Raspberry Pi Zero <gascoar@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom drivers fixes for 7.4
Date: Fri, 13 Nov 2026 19:45:49 -0800
Message-ID: <20261114034550.878760-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:

  Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.4/drivers-fixes

for you to fetch changes up to 109d5fda6c07649d4bb9270fd99f5c75e3e49fde:

  platform/raspberrypi: vchiq: register bus at subsys_initcall (2026-11-13 19:36:46 -0800)

----------------------------------------------------------------
This pull request contains Broadcom SoCs drivers for 7.4, please pull
the following:

- Martin fixes the vchiq driver probing order to restore audio via
  bcm2835-audio on Raspberry Pi platforms

----------------------------------------------------------------
Martin Wetterwald (1):
      platform/raspberrypi: vchiq: register bus at subsys_initcall

 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
