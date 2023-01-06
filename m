Return-Path: <SRS0=Ci6o=5D=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87787C3DA7A
	for <soc@archiver.kernel.org>; Fri,  6 Jan 2023 08:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 51523C433F1; Fri,  6 Jan 2023 08:12:32 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70318C433EF
	for <soc@kernel.org>; Fri,  6 Jan 2023 08:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70318C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so560385wms.4
        for <soc@kernel.org>; Fri, 06 Jan 2023 00:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GyfJFZdIdRh2RsiYptrx5CNUd4d9thwSYOnDDNRq4ac=;
        b=QbXT+24yt8nEeOm0EF1IRu5b7CIQIFHS4PUlvHMQM0VYS0Z0T2pC5sqNPGEiN56jqq
         jRKQL1lnyNNlFTwoxsJWrNJ6UDN3wGhA/XWAqvzETE8KS0cl3vP0W0qkd0VkEoR5xfp9
         Q9h6uaLV9W12L2jVLlSPpSXvO1/jmyeOINlqRMDnWnwvDOVGGMQyKpI/BNZzG9wlFXW0
         1Y3MNJjZAuPvhBhXmalfuuXsBmeW212mfkzgakOX+nULKenaRgrYeuN3Kn4FL81/v5f2
         aI4sV1RJxJ9wCQgPVsMalUwEAGZHtJpMrV/illsAGJyodCETn6yXJEWI++BLuol0tHZF
         vvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GyfJFZdIdRh2RsiYptrx5CNUd4d9thwSYOnDDNRq4ac=;
        b=VaDtVQW6iA816qo71VTkBaa0xFmiwTurLxoZaud9Kq+fX6NHoT/sHL7aNEU/NZniok
         za7E8+O7pE7qYw+b+lFaeetz4ldFTDUiHuYOjQB+CZ+ituIIXdCQ0WglzL1tDsns7EUS
         zlmiq/WC0ZVLJj21UE0lAvZBz/JYuwsDtNbx9ZRVQIrTopaU1SXmA5vy5dtYSE8sxyNE
         4DFB+aaVuvfl6e1BzNdbkyMqvotUzSG/iRR4ItzYrH90i41j7n/tfxRAacdibXNuKojA
         czkgSbMzC+AE+Vrh8rrPLmXhJV1lFQkp3looxQTgozBh2LKwkUQSD735gje/DsyyQTXT
         tPbA==
X-Gm-Message-State: AFqh2kp78WaN+7zHbFvlYI9zujqwBZGjque0DHD0EDF/Qy06jPuP2QeE
	ptnyOJVXcSWdDWQLNSCj+InfAs96j+I9xxuC
X-Google-Smtp-Source: AMrXdXs+7AhCAtGKN3vokaxcoula6Zun3EwFm23Nv2khgIVWsTKJES4Z+Fvpg/IJXBOyIU7AokfuGg==
X-Received: by 2002:a05:600c:798:b0:3d3:5737:3b0f with SMTP id z24-20020a05600c079800b003d357373b0fmr47485848wmo.36.1672992749604;
        Fri, 06 Jan 2023 00:12:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a0ba:a5f3:d9f1:7e25? ([2a01:e0a:982:cbb0:a0ba:a5f3:d9f1:7e25])
        by smtp.gmail.com with ESMTPSA id o9-20020a05600c510900b003c6f8d30e40sm6034506wms.31.2023.01.06.00.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 00:12:29 -0800 (PST)
Message-ID: <7915c3f8-57bc-25e2-0314-c78af7a79d6a@linaro.org>
Date: Fri, 6 Jan 2023 09:12:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic fixes for v6.2-rc
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Reply-To: neil.armstrong@linaro.org
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a DT revert for v6.2-rc1 which fixes USB on Odroid-HC4, having both USB2 PHYs
enabled is necessary to have functional USB on Amlogic SoCs, even if one port is unused.

Neil

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-fixes-v6.2-rc

for you to fetch changes up to c45219cba101f32853d011da2ba46a1b2338dc4c:

   Revert "arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0" (2023-01-06 09:02:40 +0100)

----------------------------------------------------------------
Amlogic fixes for v6.2-rc:
- Revert "arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0" which breaks whole USB on Odroid-HC4

----------------------------------------------------------------
Pierre-Olivier Mercier (1):
       Revert "arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0"

  arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 8 ++------
  1 file changed, 2 insertions(+), 6 deletions(-)
