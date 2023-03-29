Return-Path: <SRS0=dvnw=7V=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73750C6FD18
	for <soc@archiver.kernel.org>; Wed, 29 Mar 2023 12:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 396CCC433EF; Wed, 29 Mar 2023 12:23:04 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD486C4339B
	for <soc@kernel.org>; Wed, 29 Mar 2023 12:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AD486C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id bg13-20020a05600c3c8d00b003ef90adc168so1720656wmb.5
        for <soc@kernel.org>; Wed, 29 Mar 2023 05:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680092580;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZHfKG+E4efNoQwXPSxPG/5jUC3noBlzcf9wCRGCH2gM=;
        b=bp1MUtMwcoBxDMNX8aLUxJJngqz5fWMuKR3N3V2MLtL8Of6MRaDnd3+sq1Mhbazok6
         FurA6nZm1pcDNi5INwJYkAmzlwJp/0eArNBpHBHecpdD0c322miaa+e6fXEruc0QgSUf
         OmsP3w35b/u8c0tdmGPkSk05G5sAnk8uEZ3LDN6RI+a8k3RKfgr71/CCKhQ35oplFM3+
         SPDIhaFLOpkfuW07cjJ8DBtXWLRLBEahmP+g1JQ4Omn78mU9u8Qqssr+lcRwZOTNK1XW
         ExI2rM/cRy8M1nouV37DWDQd4BPkwJCpnAspaG0eNuQ0Q58JZf8irlMjU09wd4XmKfPC
         7QDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680092580;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHfKG+E4efNoQwXPSxPG/5jUC3noBlzcf9wCRGCH2gM=;
        b=NLMZMqfNKo5NANFnc/2DbGa27bxvqwuA6tz1xjkfVmdl/MTewAPA7TIrNW87p1NVJn
         8JsD+WBl3iCIB6bkuOuUErg3/hkN/R9Bo94avYIg1545FgTkU0n/ZGK70WlndRRZdIWN
         YtY2++QGYSRqPDF3U2C5mUlgIEXTl9YjrFIVomRW07C9YB9jcKPHgnYr+8z3sJK7ld9Z
         Yb8kr++wqjMuR0D9W0vyhypMp2wLw6Dx5oS9r/DRiCqwP0OD46ugoF10uGIW56BeyfIq
         Mtc5LvtOAMN5JfzbPGQX7PjNn50+WjSo5V5QNGi3H+sToCrACAcBOWM503u9DBpET6Mj
         WHEA==
X-Gm-Message-State: AAQBX9er3Fy1MUdGCjaxhQPDMooo16dV/MGoDg1rYsm1MCVXFC9GF2Si
	dj+Nr7matNtsoregaipl0NiuLr7gCCXbZFB+mbZPSw==
X-Google-Smtp-Source: AKy350Zf3iXeyV8HWlp0DqmYv47pev44UJE5kdHcyWJcctFoflQHm2VPhrLHRasu7gsCmvQXXwpf4g==
X-Received: by 2002:a05:600c:204f:b0:3ee:6d88:774a with SMTP id p15-20020a05600c204f00b003ee6d88774amr1400047wmg.14.1680092579919;
        Wed, 29 Mar 2023 05:22:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:72a8:b5f3:7fb:fd29? ([2a01:e0a:982:cbb0:72a8:b5f3:7fb:fd29])
        by smtp.gmail.com with ESMTPSA id iw13-20020a05600c54cd00b003ef6988e54csm2149166wmb.15.2023.03.29.05.22.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 05:22:59 -0700 (PDT)
Message-ID: <db5fcdb4-60e8-95e6-06b5-1ac474ecabe3@linaro.org>
Date: Wed, 29 Mar 2023 14:22:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic fixes for v6.3-rc
Reply-To: neil.armstrong@linaro.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a set of changes to solve a conflict between the DMC memory space already
filled with a node and the Amlogic memory bandwidth perf HW that was using the whole
DMC memory space. The patches fixes the DMC nodes definition and changes the base
offset in the perf driver.

Will acked me to take the perf driver fix through my tree.

Thanks.
Neil

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-fixes-v6.3-rc

for you to fetch changes up to f9d323e7c1724270d747657051099826744e91e7:

   perf/amlogic: adjust register offsets (2023-03-27 17:31:22 +0200)

----------------------------------------------------------------
Amlogic fixes for v6.3-rc:
- fix conflicts between DMC memory space and Amlogic perf driver

----------------------------------------------------------------
Marc Gonzalez (3):
       arm64: dts: meson-g12-common: specify full DMC range
       arm64: dts: meson-g12-common: resolve conflict between canvas & pmu
       perf/amlogic: adjust register offsets

  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 15 +++++-----
  drivers/perf/amlogic/meson_g12_ddr_pmu.c          | 34 +++++++++++------------
  2 files changed, 24 insertions(+), 25 deletions(-)
