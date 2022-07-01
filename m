Return-Path: <SRS0=8y+7=XG=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850D4C43334
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 08:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 567ECC3411E; Fri,  1 Jul 2022 08:10:05 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82C51C341C7
	for <soc@kernel.org>; Fri,  1 Jul 2022 08:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 82C51C341C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id r81-20020a1c4454000000b003a0297a61ddso3227200wma.2
        for <soc@kernel.org>; Fri, 01 Jul 2022 01:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:to:cc:subject
         :content-language:organization:content-transfer-encoding;
        bh=urfXnQFf8lee47nSLlfhwTosSVCF2VVZF7chXj2fkIQ=;
        b=DshPVdS8/FO6WCE1hdXngdZUjQaEbY1+55s56TVplpXEDl7+Gvtn3Puq4n39xx096K
         qi5eBvaxiHVSLlAdDf+QvRbM/ltjmSlV3vDgvVMPIrhumybZvYpGZdi4j6jxcKeBrKQ4
         2PA/+LJxp9cU2A5JgIibwN4N6kXIREmbPzDzVipExghhQzO5TuQdtYCo+j4jeWppNJgB
         5HZ7RZDbMlStWmKsh7zYzM0Xpqd4VFR/aYAFLHojMdkXTYOxUSAv+9WkNnRhRItk3TYe
         ME+Bh7AK+5EjKT1cdF1an86W4TK6EXoQlMQdMEWPvm3sXnOi9ZY2NBnzObdYufGq55wg
         BpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
         :cc:subject:content-language:organization:content-transfer-encoding;
        bh=urfXnQFf8lee47nSLlfhwTosSVCF2VVZF7chXj2fkIQ=;
        b=DbU0mRciC9NKCXqsVFYN2Bb875RQOVOjLR/qP9tPLVfurvdPVI74idvvBNAutzpqj0
         g1tfcd7zgJaUFkGiEImoAH0sEiglxnMZ0XGMWhbOj0sshjX2oW5Hw5E1uKqR2qwrQftJ
         PcLu5Ka4j1EwHuL0oE9nEP8t3bhL798Aoz9kZLjxImCa12eDdVtYj0kISIzuM4ziF/AU
         mwd9jBaDLFEmhpVeyROSd1rHwnjr6b3Zzig4nzBpzxo7DYKQg+sXdYCiJqzGeK7tB1hj
         oB1Xd4N3xQfJ56rjmbpPX7WKQcM5VHdyMDA3a5quJ/sNxuOQoINrI+LvYLiWSClH36sI
         V3uQ==
X-Gm-Message-State: AJIora+XivY7BP9EF0tstlF4WGBgxK1B/2jm6ojQej7aRvsvPoTwyIUs
	o8BQOZ/NAhojDRDpLDzLwqKAdr8Eu4bFw6ui
X-Google-Smtp-Source: AGRyM1v+njBFoeEjpQR6P1UIx7Hhvceuf+h39EIAS9k/yljAVQ2mNXlCG9w8Iw5cObgn/N+IxPqDtA==
X-Received: by 2002:a05:600c:1e87:b0:3a1:8f12:8a8d with SMTP id be7-20020a05600c1e8700b003a18f128a8dmr795964wmb.3.1656663000427;
        Fri, 01 Jul 2022 01:10:00 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:5d81:390:1737:2a33? ([2001:861:44c0:66c0:5d81:390:1737:2a33])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d6551000000b0021b932de5d6sm21853730wrv.39.2022.07.01.01.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 01:10:00 -0700 (PDT)
Message-ID: <cbf6bcb5-c7be-40fe-4436-4578c9d6c532@baylibre.com>
Date: Fri, 1 Jul 2022 10:09:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From: Neil Armstrong <narmstrong@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] amlogic ARM updates for v5.20
Content-Language: en-US
Organization: Baylibre
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's an Amlogic ARM change for v5.20, a minor refcount fix.

Neil

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-for-v5.20

for you to fetch changes up to 34d2cd3fccced12b958b8848e3eff0ee4296764c:

   ARM: meson: Fix refcount leak in meson_smp_prepare_cpus (2022-06-10 08:43:05 +0200)

----------------------------------------------------------------
Amlogic ARM mach-meson changes for v5.20:
- Fix refcount leak in meson_smp_prepare_cpus

----------------------------------------------------------------
Miaoqian Lin (1):
       ARM: meson: Fix refcount leak in meson_smp_prepare_cpus

  arch/arm/mach-meson/platsmp.c | 2 ++
  1 file changed, 2 insertions(+)
