Return-Path: <SRS0=I1vS=LG=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AECAC48BE5
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 03:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2BDD761374; Sat, 12 Jun 2021 03:10:09 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DE27611B0
	for <soc@kernel.org>; Sat, 12 Jun 2021 03:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DE27611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-qk1-f180.google.com with SMTP id f70so17885118qke.13
        for <soc@kernel.org>; Fri, 11 Jun 2021 20:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=YHbD/mqCuSEzcC4RtK8XYrrBs5SxDQZwxPGKgUy8SlM=;
        b=rpinneijh7hd0eRqrHUCVKLm7oZHpwZB0G+4hgQ8j8yaa6WTiRsRY7o6T+YMvPqrra
         ejTlsWMIz86dBpbLlaSzfXLMF1i1CU67t9sJaBXloBEdnuYJ8vdZt/2ursU1NrvxTAE8
         vMzLDoSaWtzDzQpF7NJVYbrm9ZkF5cDyhQQg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=YHbD/mqCuSEzcC4RtK8XYrrBs5SxDQZwxPGKgUy8SlM=;
        b=RTUY8IFEORXgqnMuiWOlFNXKle4TYxP12eOP/aiXque5XUvoUKmF/lzU1QnvmJSX8u
         hdvUAMohX2uYVQ6B30W6fdm0gmKh5WyYZX9Vuhd1lai0E0A3TJOHQKFRZNWSAAtKfHTa
         zQL2Y5yNh5K+SIxVklkugLNEgGa6EmoyViyCeYCV/WJR7G5s4pc4z4rxx8D0oWpfD0o5
         NEB4K+wf0DioVm4ULSMjA1KCI5aaMLJSFyXhpEMEbkkASgfGp+vquJdXRSiIDturIMdp
         U0euew+a0MvUsAF1tY41xbz0El8tv428XqVRJV0vxROBxWqFksPo838EJgxa4JxI2UYf
         Rf7Q==
X-Gm-Message-State: AOAM532SFqvK/mv9BQK6t5uNYucAAVBQXmHpcpvT9H9oMhTcOx6Flt/8
	QkiRnXE7Aa0nP7A87y8ktDUkbQbIYOQ3fOiwbNHJfg==
X-Google-Smtp-Source: ABdhPJxuioRL5IHEdYVJvdAATuTZJJREI76GNFQ6UykbwmNwyly3PJZuJdWcqHaduWqlSNmreaAtSxscYYu0md6s6xw=
X-Received: by 2002:a05:620a:b:: with SMTP id j11mr7094529qki.159.1623467407535;
 Fri, 11 Jun 2021 20:10:07 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 12 Jun 2021 12:09:56 +0900
Message-ID: <CAFr9PXkMSDvks+DeCNJ6iKf6zDH0VaOL6msirR3g2K7BNL8YkQ@mail.gmail.com>
Subject: [GIT PULL] ARM: mstar for v5.14
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, 
	SoC Team <soc@kernel.org>
Cc: Romain Perier <romain.perier@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mohammed Billoo <mohammed.billoo@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd, Olof,

This is my first time doing this so apologies in advance if I've messed this up.
Anyhow, we have two very small patches for 5.14.

- Romain has stepped up to clean up some of the ~300 patch backlog for
MStar and he added support for earlyprintk in the process.
- In an effort to do things properly I've moved work on the MStar
stuff from my personal github account to one for this project. So
people can find it I've added a link in MAINTAINERS.

The following changes since commit 614124bea77e452aa6df7a8714e8bc820b489922:

 Linux 5.13-rc5 (2021-06-06 15:47:27 -0700)

are available in the Git repository at:

 https://github.com/linux-chenxing/linux.git tags/mstar-5.14

for you to fetch changes up to 06d09c789e2a78852adc99c54945457870247b09:

 MAINTAINERS: ARM/MStar/Sigmastar SoCs: Add a link to the MStar tree
(2021-06-12 11:40:49 +0900)

----------------------------------------------------------------
Daniel Palmer (1):
     MAINTAINERS: ARM/MStar/Sigmastar SoCs: Add a link to the MStar tree

Romain Perier (1):
     ARM: debug: add UART early console support for MSTAR SoCs

MAINTAINERS            |  1 +
arch/arm/Kconfig.debug | 11 +++++++++++
2 files changed, 12 insertions(+)
