Return-Path: <SRS0=8H8H=HM=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB23C433E0
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 12:30:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1EDBD64E31; Wed, 10 Feb 2021 12:30:41 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A86FE64E62;
	Wed, 10 Feb 2021 12:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A86FE64E62
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-qt1-f172.google.com with SMTP id o21so1339521qtr.3;
        Wed, 10 Feb 2021 04:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=K6Y8CEeI51JVKVFBNpZEdZAuFjEFDlhuqajn9o/8bz0=;
        b=LHvT77Xb3sRA+i67qoAcKDujAXWRnXedOh3AqlFooWQa90+us7QYqqegbJJGFfMUC+
         s3MC8V6k0EyVaMCf7qS/N/H7EKUhf+kdJfcoWmO17+kBFa2tgOg0ITZeBK4jCV14gGHM
         wepQj4Ftt+TlJH7uyCyFFlOIPLQXVXAujsiBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=K6Y8CEeI51JVKVFBNpZEdZAuFjEFDlhuqajn9o/8bz0=;
        b=TKnQFVy1sLbM+Ig8AHNp0aevDtr8f7oQPtpmSmMWRgiLLZ0W8Itxuh6DuNG9OPLIOq
         Z09P3Dmp3oRv133I6KePeb49Rm6JeNsb+LWAt4alXboI9bDMNN7wthjfyeVSD1aIeM2A
         CeHmk8IJCd29ciAr6JhW6JPxZVQhmuMj/3iJ1KC31Dyk4KJQg5oZUjQ+aiYp+PGJLjLb
         UPNuGU0rvlL2yq4n3jHkPBGf66IUTZTjEBD0nI22wPnAFK2cxWdxEd/iEjlNXEI0/j79
         49CNM1a7YYbU3GCGbdS/aoHsJzF1mkgrOdaiPRTjyjC1k17reqcNbxCsHmpUksMMVZhA
         d17Q==
X-Gm-Message-State: AOAM530NV/j8m3KDEvrDNk7cs5sPGzl87lUbvAZH49acXVX+EUt2OVI7
	YoYIAvXwGbKXKbDbLD40lJZQk5ziJ1LYBlVIDmjNsoPkYUS4Ng==
X-Google-Smtp-Source: ABdhPJz4nqhjURxaff+V137RrYa6jcy7NOyn2z01tcRyGYecLPyd1UOZKfNnMC5+/A/QVwqNSy2e44EqGL/VQTWsZJk=
X-Received: by 2002:a05:622a:143:: with SMTP id v3mr2423251qtw.363.1612960239154;
 Wed, 10 Feb 2021 04:30:39 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Feb 2021 12:30:27 +0000
Message-ID: <CACPK8Xf+4VkWC6rkHhsWdwhaLjy2Az=GAHaEe=SvOiUc_OGKSQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 5.12
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm <arm@kernel.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

A small pull request for the aspeed platform this time around.

The following changes since commit d0e72be77e7995923fac73f27cf7a75d3d1a4dec:

  soc: aspeed: socinfo: Add new systems (2021-02-10 22:25:45 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.12-soc

for you to fetch changes up to d0e72be77e7995923fac73f27cf7a75d3d1a4dec:

  soc: aspeed: socinfo: Add new systems (2021-02-10 22:25:45 +1030)

----------------------------------------------------------------
ASPEED soc driver updates for 5.12

 - Clock control logic for LPC snoop driver
 - New system ids for AST2600 variants

----------------------------------------------------------------
Jae Hyun Yoo (1):
      soc: aspeed: snoop: Add clock control logic

Joel Stanley (1):
      soc: aspeed: socinfo: Add new systems
