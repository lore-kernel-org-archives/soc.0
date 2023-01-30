Return-Path: <SRS0=3UeS=53=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BECBC54EED
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 13:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2EEDEC433EF; Mon, 30 Jan 2023 13:50:44 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D3CBC4339C
	for <soc@kernel.org>; Mon, 30 Jan 2023 13:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0D3CBC4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so8644238wmq.1
        for <soc@kernel.org>; Mon, 30 Jan 2023 05:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kPfRJdyRzBMwBkAF3aejwJ5wi37fWxKDR32t15X5N2k=;
        b=lALITlGubNV03BPM2ovUjJzYf0y7XqOTsGQqh9lANt1U4ENGQiyiUDHmmvqAGHIr0H
         TNZkTtZXqdgIQkhbLu6M+9EQxfQrNWxQJAfnd7lA7efoA/HtWkdDvJ5Ug8agYR4bjK/0
         gp3iNrClE5EbTHkg67bmC0WrSv290MEwGY9HX7dlX22KD6bS2h0emccUhD4iwxxQZeEb
         Xb5owubSXvGKv+H5n0sMSKV5bEOh6nCsLWl9GuzzYXwB9oZ2MEnZ6cmh7E8e/ABHe0DK
         fsqF1atS9ij8pgrrQOWnTHS00mim5vguzcSieZN2lqXajvO0fxaNi71wJv/wUItYmlIm
         1Q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kPfRJdyRzBMwBkAF3aejwJ5wi37fWxKDR32t15X5N2k=;
        b=JkDxw0pnB0e9gsCfg6qzBENFubFl7lC33GwBHBAmiwiEdmSJ6DUT7hDvOqOdGEBHgP
         9ogbQXXxwMkwkeu/S4GYpU9qyYylwFFdnBXiLsrGxStRcliPxd0uPypH7n/Y7mpNA0ml
         R2ZcSf7mVSR2cvg4+SSWW+4l5RK0kQryK1SawRck5jaepS8SZz5eOsGD5Lq5EteOfwtv
         BS181UlQkYV6n5ZONUnxrKmvm7zqiDLcQCVT8VPaQCWnLXhrJKCSrYm3N4ttpCyCsPgZ
         DfSawKUFkQzdff40vagNrrMzxz1raW787YLvxZ4uMHmRymtF8qGp5U+8oJMHFZ73/67T
         QXhg==
X-Gm-Message-State: AFqh2koVgzOCb1/73jzgkLchgA2GUNjUO8qkUlIqvifwA8w2VtLQsZGw
	GvovilL9P93MdMo/w1gPjZTBeCNmouJJIo5t4Q0=
X-Google-Smtp-Source: AMrXdXtCNP44PvDMUJHZeCvGRPDoMScvs4MBxav7tP5n4/QTbb3aqYaVn3FiO1h/abQU1xBddZtCXg==
X-Received: by 2002:a05:600c:3d98:b0:3d6:ecc4:6279 with SMTP id bi24-20020a05600c3d9800b003d6ecc46279mr46869944wmb.27.1675086641291;
        Mon, 30 Jan 2023 05:50:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5f17:219:cb05:7cd? ([2a01:e0a:982:cbb0:5f17:219:cb05:7cd])
        by smtp.gmail.com with ESMTPSA id o16-20020a05600c379000b003dc49e0132asm7395967wmr.1.2023.01.30.05.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 05:50:40 -0800 (PST)
Message-ID: <61700737-c226-1c07-fba7-6dca896fdab4@linaro.org>
Date: Mon, 30 Jan 2023 14:50:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM updates for v6.3
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Reply-To: neil.armstrong@linaro.org
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's an Amlogic ARM change for v6.3, DT fixes and L2 cache addition for
Meson8 & Meson8b.

Neil

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.3

for you to fetch changes up to 5f4416849f0e2909189263ab76a1dd533f597d72:

   ARM: dts: meson8: align OPP table names with DT schema (2023-01-20 11:34:26 +0100)

----------------------------------------------------------------
Amlogic ARM mach-meson changes for v6.3:
- align OPP table names with DT schema
- meson8/8b: Add more L2 (PL310) cache properties
- align LED node names with dtschema

----------------------------------------------------------------
Krzysztof Kozlowski (2):
       ARM: dts: meson: align LED node names with dtschema
       ARM: dts: meson8: align OPP table names with DT schema

Martin Blumenstingl (2):
       ARM: dts: meson8: Add more L2 (PL310) cache properties
       ARM: dts: meson8b: Add more L2 (PL310) cache properties

  arch/arm/boot/dts/meson8-minix-neo-x8.dts | 2 +-
  arch/arm/boot/dts/meson8.dtsi             | 5 ++++-
  arch/arm/boot/dts/meson8b-ec100.dts       | 2 +-
  arch/arm/boot/dts/meson8b-odroidc1.dts    | 2 +-
  arch/arm/boot/dts/meson8b.dtsi            | 5 ++++-
  5 files changed, 11 insertions(+), 5 deletions(-)
