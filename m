Return-Path: <SRS0=ZbGo=JT=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEE0C433B4
	for <soc@archiver.kernel.org>; Thu, 22 Apr 2021 14:09:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 469F261459; Thu, 22 Apr 2021 14:09:58 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B46E361404
	for <soc@kernel.org>; Thu, 22 Apr 2021 14:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B46E361404
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pf1-f173.google.com with SMTP id d124so31733408pfa.13
        for <soc@kernel.org>; Thu, 22 Apr 2021 07:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i/gDYokLkAPezwBUXb2BsOr5s2Af3W3ok0V9LpWquAU=;
        b=N7ENIt8Xs1yz0f7dPTt2wNX8vJT0WXdfihgGZ458k3u9hTanbU2jzxaWIeLrhxQn/d
         iOcNH+djBrtHU4Kqx0jkHYue8jOjGc6FRX17eO6QUbmnPsDWtQQctwdYvUMwn3Hfzodg
         i0NXr9LIBghXDvgk/j0lnsClK5w1kj/1Gu0VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i/gDYokLkAPezwBUXb2BsOr5s2Af3W3ok0V9LpWquAU=;
        b=ocDJPUf5CcHGNEWYjtjggmFdyP1jz+qhz58vjo2Wz2IfbJWwiDW0xkYS7FlDhYb3Nx
         ceMqgpxwm4WhCvjdT9UDp9dja7g+EejA+K1cAewuJduEBW6qBvW4oLni1vLlDKu861gc
         TeUtjEX1ocu5wDVs6hBLeYUXnN0nEgyryDYXKmmB5dsWhmDgy6Kh7c7fUIM+LnV/4maA
         Tl9iK0SS/g4u6I5RfkSR1c63f/OUcabloF+xSU9t59Vc0CguXO6IB5f46uftlp/5qXNj
         K0S7DIm0EATkYMysFMqZTzJb2ZfXGupUt2+fOdvB9h5YY4co/OPwD7zexH+j5SRjpxgv
         cuRA==
X-Gm-Message-State: AOAM533UWjU0zu4hMWvMlgXxZueyv6iYMAQvwr25tIFcYcHIA8DWmvKP
	85BxVSnW2MBN6JD0aCS0TUhGMq/b4wY6Mw==
X-Google-Smtp-Source: ABdhPJyoDqs9mOArEmPY462NVPxiecr+xvGgEdEMAjNbX9P5K0PrbQakJOQWzfjdkXTJ7aeqkMpwWA==
X-Received: by 2002:a63:1214:: with SMTP id h20mr3698845pgl.207.1619100596840;
        Thu, 22 Apr 2021 07:09:56 -0700 (PDT)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id p12sm5278968pjo.4.2021.04.22.07.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 07:09:56 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: olof@lixom.net,
	arnd@kernel.org,
	w@1wt.eu,
	Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH 0/2] ARM: mstar: Internal bus madness
Date: Thu, 22 Apr 2021 23:09:43 +0900
Message-Id: <20210422140945.4131092-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MStar/SigmaStar SoCs have some very weird internal
bus bridges called RIU and XIU. These seem to be a left
over from when the CPU core was 8051 or MIPS.

Basically they act as a bridge between the ARM CPU and the
lump of standard peripherals (ethernet, usb, sd host etc)
that has been used throughout all of their designs.

RIU has 16bit registers 32bits apart from the CPU view while
XIU has 32bit registers 64bits apart from the CPU view.
Older chips (MSC313) only have RIU, newer chips (MSC313E)
have both RIU and XIU with some IPs accessible via RIU with
the original address and via XIU with an additional address.
To make things really fun some IPs (memory mapped ethernet PHY)
have registers that are completely accessible via RIU but only
partially accessible via XIU.

The main issue is for non-MStar IPs connected to these bridges.
All of the MStar IPs seem to have 16bit registers but the
ethernet controller and usb controller are third party and
have 32bit registers.

The kernel drivers expect the registers to be at normal
offsets and not broken into two parts so they don't work
out of the box here.

I want to hide this stuff as much as possible so it seemed
like a good idea to hide it in a header and use the headers
in the unfortunate drivers.

RFC because maybe this isn't the right approach and I'm
sure the two readw()/writew()s for RIU need to be protected
somehow but I wasn't sure how.

Daniel Palmer (2):
  ARM: mstar: Add header with macros for RIU register access
  ARM: mstar: Add header with macros for XIU register access

 MAINTAINERS             |  1 +
 include/soc/mstar/riu.h | 28 ++++++++++++++++++++++++++++
 include/soc/mstar/xiu.h | 22 ++++++++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 include/soc/mstar/riu.h
 create mode 100644 include/soc/mstar/xiu.h

-- 
2.31.0

