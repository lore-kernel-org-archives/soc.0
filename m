Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D18C71155
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 22:35:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74BF620671
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 22:35:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vev3WP7q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nNzt78S5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74BF620671
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j1mlVhmd96Ybuc4JwQ3ezDYS9w4YvQW1piFxOqBq2d8=; b=vev3WP7qaMTdgo6TE+4eiDmWxp
	4ebGiiO/9R6+AIfBOaNShoMuBr7+grMx57Y8B1Qo2N0HEU4wDJmL1kJKoRcoy0aSzlnAk8mPcKuH7
	/+HlwATlv3SYX2fzqIf2iQqayOhuQ0i2+WFO14JVgFWkthiVMDTC3+9IbRe2xFbrPvJi/dYb619sc
	QooOuoCQmk1RfNKv69zE6EYgB0MB3pxP2M4Y9JCmo9ynpwR1rt6ToTkw+nf/Qy6h+jTPZNZ+b3Wzy
	VCiJO5EEL8fqaDlv8/bsArfqVB1jgcNamV0CehJUvcz1IDM9xgc3HCjwvpxXmzkiYqo9V+MNdRrGZ
	1mJ0GpzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkEDq-0006yY-U4; Tue, 01 Dec 2020 22:34:10 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkEDm-0006wX-PW
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 22:34:08 +0000
Received: by mail-pg1-x52e.google.com with SMTP id w16so2116286pga.9
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 01 Dec 2020 14:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=VyzfJ/61zrG7IqqeZutV6Kfadw97Jz4TS784b21IDMU=;
 b=nNzt78S5S48ZE/IcUMAwdahKLVZjBUFIuQCRYrD4KrxZIdtdww6bR2Fkz6BGspJDZw
 6c43QemXoqYl96hnBfF/FkXY16wo46YNiLIS5ilW/Ja13FEwgQWyTFp2ed+ZYG7J4rIN
 dly3YV3utx5BLHrZ/lK6ZNCwUf3capvAr/0SjlJAkWuT3CSHzpJqBuZv/iZtuTc/xcEq
 FsjhcKMaepOVDzYWk1WAPx5B3elWyOqHU4nAzpTruyMn8OiqAhzvlhnrk1kUe6yVP5pv
 369V4IkybhxupTFJOMXY87Y36U2WvE4Buje7fbvGoee+YPPI7YGSFJprGxqQF8snmBgP
 uYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=VyzfJ/61zrG7IqqeZutV6Kfadw97Jz4TS784b21IDMU=;
 b=aNRT/uP79hCxL7wPoEdioJn3C2v27x74CYectEFOlmI01s216mvwxhofBalQcDt1sP
 /RaiV3GtqPjanvdteYmdgWGB3beWoQVKsLd2v2nS3C1um4MUSV/SA5nwGEGeyo8b6MkC
 i16cz/3KraNzscaAWLThkqdsgZxOjA4AsqW9LV3iN9s+6OrREY/vJe+Y0/ljpWf15mS+
 SjIiwknhSQbhC8xV1kanCHUuRRgDjiIyg9TCes04de0z7Zxwze7Rmv3TRL17WnRKOuXu
 g7kE9GgByYmHTJqQNKeqgZOWN+dyK30zneaMH7N65K0tlYOZbYPUYl557fBw8I1HSFMF
 FosA==
X-Gm-Message-State: AOAM5304WvMw2ip5n8G88he49IgHOd+TIDLWTGuPOsZFiC04KumDTdlb
 laHFLUJy11Bqiy1w0GhDi7o2CQ==
X-Google-Smtp-Source: ABdhPJxBd1oN35igDNqmACXUehdFdQoZ9jvY2+9kX/+z0H8mYfOJtWiRC0fu6GepFnx4poTHsv477w==
X-Received: by 2002:a63:fc5b:: with SMTP id r27mr4188310pgk.100.1606862044394; 
 Tue, 01 Dec 2020 14:34:04 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id h7sm736014pfq.76.2020.12.01.14.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 14:34:03 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] arm64: Kconfig.platform: amlogic updates for v5.11
Date: Tue, 01 Dec 2020 14:34:03 -0800
Message-ID: <7hlfehjgv8.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_173406_998490_9E3C94ED 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201223403.tJsbKTwZg4igV27rYx7f5NDbDK_Jjep3BjzkuxKt66I@z>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-soc

for you to fetch changes up to ba66a25536dd24b73d36e380c68593e95e4e06a8:

  arm64: meson: ship only the necessary clock controllers (2020-11-09 16:06:11 -0800)

----------------------------------------------------------------
arm64: Kconfig.platform: amlogic updates for v5.11
- ship only the necessary clock controllers

----------------------------------------------------------------
Jerome Brunet (1):
      arm64: meson: ship only the necessary clock controllers

 arch/arm64/Kconfig.platforms | 3 ---
 1 file changed, 3 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
