Return-Path: <SRS0=g/1M=JN=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DC5C433ED
	for <soc@archiver.kernel.org>; Fri, 16 Apr 2021 03:27:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9888961184; Fri, 16 Apr 2021 03:27:45 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E2B060240
	for <soc@kernel.org>; Fri, 16 Apr 2021 03:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E2B060240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-qk1-f182.google.com with SMTP id b139so22163084qkc.10
        for <soc@kernel.org>; Thu, 15 Apr 2021 20:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=hIEr+tr3/ET/1Cl+rSjZLlzUudCQ/0HpO0ED+ltgzjw=;
        b=lGig1pNBMlxzjmddWxyj0zU4kOdqrE+O58NgiXultbPSps0GikWUhIIpVBogYGDrqK
         MvxisbuXyv1tXvG1Ifc9AMlZqpofVA57Yq7HnOzFEAxQhWhEdNkA0ks//gnpK5rXdZnW
         E5A/RDr6c+C7OR33kSI85xUb0Gjc/yg9hSj9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=hIEr+tr3/ET/1Cl+rSjZLlzUudCQ/0HpO0ED+ltgzjw=;
        b=pa+IM3JGPDchbWgWkOZT4oS3lQdhfo+IFehyBWQeBqdwhm0ugiaFbiXHszKRM/Kr40
         gaiBgNOUtvmmSCS/jNA19HSV17cfexvWurbyX1K+ROzXU+5Lr/qyAkkLZkZHeLv2AXZ/
         aSK5W3lcDOtp9X1cYWaUGaXut/i1JJLwgaGilS9i2wl+gJwH1voCZfDiqchy1Yknmtpu
         Rzqgj5z6OiyyhW9shn2mRiS76z+cekLRjPuDykOQjXhDZnPDNfSuIB5K4Kr67kl9Zr0j
         QRAM3cImXnuRwYE27is09BFQpBzo7q76wMiFxTLYir76spMAHkgya3ksiJVZdUoZUzJf
         9Bwg==
X-Gm-Message-State: AOAM533oMO3LxOE+o1NysKlaNMcrSvmavz75i5dnhJJbJLITlNtdc+0H
	qi00zaRoFBMam5YP7lGwqZJcJ5iuIR6O24hw6kf8kCkk8NA=
X-Google-Smtp-Source: ABdhPJwo7aOv9fBXv6Ye/9cef0EbrWn2KMN5NwfyUtDNGBb/rSIK+BQamE4oOXmWc6J2wernKD4FS9tKwyE65VxKFYA=
X-Received: by 2002:ae9:eb94:: with SMTP id b142mr6744912qkg.487.1618543663075;
 Thu, 15 Apr 2021 20:27:43 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Apr 2021 03:27:31 +0000
Message-ID: <CACPK8Xeet50bqWAY0jG_GRkgvKvFn94XtGDaq1gaVYVkyV_JUQ@mail.gmail.com>
Subject: [GIT PULL] ARM: bmc: devicetree changes for 5.13, v2
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

Here are some fixes for the changes that have already been merged for v5.13.

I also merged some changes that came in later. If you would prefer to
not take them then I can send a pull with just the fixes.

The following changes since commit f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:

  ARM: dts: aspeed: tiogapass: add hotplug controller (2021-04-16
12:28:38 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/bmc-5.13-devicetree-2

for you to fetch changes up to f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:

  ARM: dts: aspeed: tiogapass: add hotplug controller (2021-04-16
12:28:38 +0930)

----------------------------------------------------------------
BMC device tree updates for 5.13, round two

 - Fixes to the first pull request for Rainier

 - Small changes for Rainier, EthanolX and Tiogapass

----------------------------------------------------------------
Eddie James (4):
      ARM: dts: aspeed: Rainier: Fix PCA9552 on bus 8
      ARM: dts: aspeed: Rainier: Fix humidity sensor bus address
      ARM: dts: aspeed: Rainier 1S4U: Fix fan nodes
      ARM: dts: aspeed: Rainier: Update to pass 2 hardware

Konstantin Aladyshev (1):
      ARM: dts: aspeed: amd-ethanolx: Enable all used I2C busses

Paul Fertser (1):
      ARM: dts: aspeed: tiogapass: add hotplug controller
