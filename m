Return-Path: <SRS0=2hmS=JG=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62E0C43460
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 18:14:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BBC3B61182; Fri,  9 Apr 2021 18:14:17 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C534F61178
	for <soc@kernel.org>; Fri,  9 Apr 2021 18:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C534F61178
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=khilman@baylibre.com
Received: by mail-wm1-f52.google.com with SMTP id p19so3387444wmq.1
        for <soc@kernel.org>; Fri, 09 Apr 2021 11:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version;
        bh=Or1tK9HRB3KQNvChiWt3O31v+NN9OAHgu01LXwMc2rE=;
        b=d8nSmwAwu+/P15/V96M61k+B124zIEbFXUvb/o7JHDWoMoFyodtCI3fnK2OHdayyCS
         1k+pqy3tn6iq+7uZ7eN1dTHkI9hWCby/eIw+FKu4Zf5KRi/dR9kkoR+xj0Baaz6lxrLf
         g6ACzXyH2R2ZvT/aPmWpgoWPn7qjf3aPv9bnhm2w9CYdpMmqNyIkMduXP7XFn3S9Ae59
         REiCyGZcFgJMCL/AHNsPW4fJYXfliZYzp2u3/Uyk/HnHlD3fhxmymW/dBV3fBCC2+4fl
         r5GqK5aHx0rC0vOST/jK+rMtDeCdnOsY0W/yZRSgJdRBSU6pcajFpKVBxPORPF+Kvigg
         PAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=Or1tK9HRB3KQNvChiWt3O31v+NN9OAHgu01LXwMc2rE=;
        b=CnSpFLHMB3uNLiUZek57kG0xS3qKlx3gvI2yMwzJmj/s87P6E8VfvKYt7ORas2ar6S
         U38aUCsBeCxNFLTlodFFsJ1O7izRYAfGt+tkcz0ITP6N6mul1hmop3mFLE6MmeMrgYu4
         6vVMzvjzzeyLHSRedGtR4ADx9ONtiQEMlf3NHVlC/Yfc6du6kzzhgQpfwjoRwkrYFKbL
         S8wX5dKL4Z5OTcpRkkXnUPSxn/jOiPqhlkyv1T65Qiy1cfWYUcazHdk3GHbL+kyrnuxN
         zKhVJlmbf13MJqFrxSZc45nfCX5DOCq98XTIjjzgvLoSF02QW0J5kyJHWlJKspcFE/N2
         RjnA==
X-Gm-Message-State: AOAM532BMqphZClP9ZHE2+k6HywAzaChrcZYbPssgJ+1JklN4LTMVaKw
	Hl087gcYDsEVF+SmdMZVG9sRYPHwkCtcckuL
X-Google-Smtp-Source: ABdhPJwK5iJwFYOpwRwE7cKLsbES+nMkx39eAGhXrTYONmE+NA9Q+4NGhxlu5OFSft/UtZfYg7kZgA==
X-Received: by 2002:a1c:f701:: with SMTP id v1mr15034595wmh.69.1617992055134;
        Fri, 09 Apr 2021 11:14:15 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id i26sm5290791wmb.18.2021.04.09.11.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:14:14 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: dts: amlogic: updates for v5.13 (round 2)
Date: Fri, 09 Apr 2021 11:14:12 -0700
Message-ID: <7htuofgwaz.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

Arnd, Olof,

A 2nd round of DT changes for Amlogic SoC families.

I'm now aware of the new DT warnings added in the first round and will
work to get those cleaned up next.

Kevin


The following changes since commit 727d93ed3ba67307a82c3ac5ebc7e335265e8b9e:

  arm64: dts: meson: add initial device-tree for MeCool KIII Pro (2021-04-05 15:35:39 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2

for you to fetch changes up to 412c8fa8c3748cc0500b4c86a47dd28254f015f1:

  arm64: dts: meson: add GPIO line names to ODROID N2/N2+ (2021-04-07 09:18:41 -0700)

----------------------------------------------------------------
arm64: dts: amlogic: updates for v5.13 (round 2)
- updates/cleanups for Hardkernel Odroid N2/N2+

----------------------------------------------------------------
Christian Hewitt (1):
      arm64: dts: meson: remove extra tab from ODROID N2/N2+ ext_mdio node

Hyeonki Hong (2):
      arm64: dts: meson: add saradc node to ODROID N2/N2+
      arm64: dts: meson: add GPIO line names to ODROID N2/N2+

 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 52 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)
