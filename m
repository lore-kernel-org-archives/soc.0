Return-Path: <SRS0=NAge=FP=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CCEC433FE
	for <soc@archiver.kernel.org>; Fri, 11 Dec 2020 11:09:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C499623EF1; Fri, 11 Dec 2020 11:09:52 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43BEC23E26
	for <soc@kernel.org>; Fri, 11 Dec 2020 11:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43BEC23E26
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-qk1-f177.google.com with SMTP id w79so7995203qkb.5
        for <soc@kernel.org>; Fri, 11 Dec 2020 03:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=WQKg3cIi4hIsPZ9PKTpFROffzkUZwNMkNLWOKFleW9g=;
        b=aZcfuV+Qkm9nAiS4xpqiErZ/wAhNCH74SMJUU8MzxLIFNhVDD2tu0R9cULkdJQS3rg
         fJ7sjGTPldSUiyIhPiliEpZ83iFoRyNiAL3AXZxLRX/AqahpqDd9HYbQ9aTNfMos3N8K
         g6fuJF+kxPa4FbbUX8iVWVMhlIkk89tsHupR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=WQKg3cIi4hIsPZ9PKTpFROffzkUZwNMkNLWOKFleW9g=;
        b=h8jhTdfeqSDcOZHRLwOsGHAmwRI6kB5v2OTmNg/rCTpKPVJ+1qjQM7Vi9Dzz/UdXdC
         WwFPlwS21DFgQ0kAlN019k3HT+oEFS2Sr7ekvApVn/2ioRGkWoGK8hVsr52BbBm5GcHm
         dAu6DpwsDmCRz2UIturVkqX5os/SPEoDA3lHJ3TWmtGIIzyLd7c2CvaT3NlpJTzJyWmu
         KaPB+r2zgIreHIwS8pF2V64wg7qCO7Q82LT3MqiWwVDTjp7ZGtuveJQDFG6XAnYJF4zR
         ty49RvmKvc8atrb7+m+ZjX3C9V/QENjuLNshW+HrX/WNkfjIknahMckB79WXQWX7sz4W
         XHBw==
X-Gm-Message-State: AOAM530WlSoXLF+bqe85FJgSj53zMiLQlJ/UjN1EnuE87OJVtXW/e7ua
	O5Ie1gA67TdMfCb/cuZJ2ug3vd+N4WVnqkysEkp2tsrEVXt6fw==
X-Google-Smtp-Source: ABdhPJwI23GtC+rkaLZlWggpvfMhMnaZW+1xUUVYq8uFgZ6fR4Z0ABo3J/ivNeYAPB7FSf3BrykDpHzHhs00/+4VHLE=
X-Received: by 2002:a05:620a:31a:: with SMTP id s26mr14911021qkm.66.1607684990215;
 Fri, 11 Dec 2020 03:09:50 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Dec 2020 11:09:39 +0000
Message-ID: <CACPK8XfkZq51yKJUjyqgKD=R-WZiCR0J18GJBbo=tfMKMMddSQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.11, round two
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"

Hello Soc team,

Here are some late changes for the aspeed boards. Most are fixes, and
the addition of a new machine from Ampere.

(Arnd, I realised when sending the LPC clock fix that we had a few
others fixes, so he's a pull request instead)

The following changes since commit 5124cff93d99bbfe1efc8deb0c0b3604cb9a6659:

  ARM: dts: aspeed: g220a: Fix some gpio (2020-12-11 21:28:02 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.11-devicetree-2

for you to fetch changes up to 5124cff93d99bbfe1efc8deb0c0b3604cb9a6659:

  ARM: dts: aspeed: g220a: Fix some gpio (2020-12-11 21:28:02 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 5.11, round 2

 - New machine

   * Ampere's Mt Jade, an AST2500 BMC for Ampere's Altra reference
     platform

 - Fixes for eMMC, LPC clocking, and misc fixes for the g220a machine

----------------------------------------------------------------
