Return-Path: <SRS0=b5ND=LJ=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F54C48BDF
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 16:34:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4EA316162F; Tue, 15 Jun 2021 16:34:23 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8962617C9
	for <soc@kernel.org>; Tue, 15 Jun 2021 16:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8962617C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-qt1-f180.google.com with SMTP id v6so11696391qta.9
        for <soc@kernel.org>; Tue, 15 Jun 2021 09:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Mpw+juSO14IXhbnXmpjJ5EumNB+SNd/QTzAxRngqZU0=;
        b=OwnhgWRxhm1q/Kky0ungmqIcs6YMw4kIeYIvfOPX05tXnfCQYLcWlXs3a49hwczWfv
         sityG8ukLre/6ZvG7QtHKDeDW0ooyQVt/8aiyd3+EYc4BfNRIKEue/5sPcAuptTUGhp4
         gr/DVnKkm31xdIPWXTKOl0neJU53IAzQh8mz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Mpw+juSO14IXhbnXmpjJ5EumNB+SNd/QTzAxRngqZU0=;
        b=O4SkHi+IBcIz0Xx3cRZ2hn7Tyyi2zkZdUW3StMG5pCjnmWSu8ZdNFhoUYpcWngbMH3
         KY3W/rwqQq7ps9cADbn1ccKdfa2ExM94UAJBu8khhJfVMVoAVZUl+w0xwByqH+1mOTu5
         KM22SN77/Q0i1Jo3zSCe5PgVBfz6+ooYTOQh/0xTh8d1kTL4HDf5rAE0D+aLzI8XFWJ5
         AvxZzZebOYjiSMiAAxCGXkXlJXUIilTi1njWXW8yJT4s3sHyWVga9VqzuRoIkXbCy0xV
         zg13qNrIh2PW38KCVOm1Z7QoOzMbBSbx4SiDHGFkes1XwmE/+/+EBcSsYQ6jXGSU2jWT
         BfAA==
X-Gm-Message-State: AOAM533fgWqrFuQK8G8h1bsxP8TCT50/3lqDyou41T0PEQNnq0A1htRN
	CtXRRWfte1zbDs6yf1raKuWxjLIYvXhZn/o2jFXW1Q==
X-Google-Smtp-Source: ABdhPJyTt6WC6RRYHejEop/0hhJ8D7+6OUmp+FmVlPNOOZpIo46ZetWalSW1J1VyjP8Z9QFGNO88p7XWWl8nsCiAgPU=
X-Received: by 2002:ac8:7ed8:: with SMTP id x24mr500539qtj.148.1623774861742;
 Tue, 15 Jun 2021 09:34:21 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 16 Jun 2021 01:36:25 +0900
Message-ID: <CAFr9PXknSfSso6Uq0Fn_qJM5ZnJ4QK=YjJ32kKt4XYPrHK5x6w@mail.gmail.com>
Subject: [GIT PULL] ARM: dts: mstar for 5.14
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Romain Perier <romain.perier@gmail.com>, 
	Mohammed Billoo <mohammed.billoo@gmail.com>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit c4681547bcce777daf576925a966ffa824edd09d:

 Linux 5.13-rc3 (2021-05-23 11:42:48 -1000)

are available in the Git repository at:

 git://github.com/linux-chenxing/linux.git tags/mstar-dt-5.14

for you to fetch changes up to 8f610169a2865f6c6383d966ebbd6814c79d0116:

 ARM: dts: mstar: Add watchdog device node (2021-06-16 01:22:52 +0900)

----------------------------------------------------------------
Romain Perier (1):
     ARM: dts: mstar: Add watchdog device node

arch/arm/boot/dts/mstar-v7.dtsi | 14 ++++++++++++++
1 file changed, 14 insertions(+)
