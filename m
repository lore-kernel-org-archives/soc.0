Return-Path: <SRS0=AhuM=O7=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B530AC433F5
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 10:01:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9CB0260F24; Mon, 11 Oct 2021 10:01:06 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75FED60F0F;
	Mon, 11 Oct 2021 10:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75FED60F0F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id y3so21224860wrl.1;
        Mon, 11 Oct 2021 03:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=cAbwwP952kvEacD7RSRVQ9sh3+q9Zl9oRrHXxMZniwU=;
        b=GNxzCTvCIEL2Gcxa3laYCUc+2xuZunUIs3EoXxKX6bbXaPrNVgbIOwMQiLc5nQczAc
         05wqwKgMXz3rn8OeUUoX/sLp52giLbc11Vj9B8fe0iVHUS+Qf0z7ctOWDBpY0PyNju6p
         JzI/vRhWE+FxQt/1nojQJ7UBTytcJHr6nOUYmSzadvzVF3g7/bRoFhUNOh3ViHZ4g1QY
         S4FqJemOVm98IGv8Pxcghaz3cCqOrdm0EnDzhuZkRq+9gYplsj6isnOMlCIchfHotQC+
         aZenjcLG5J2TroxIzESc/YOFOFW5OvYz/t4ZAfu81rD/XLeJhXmE038hyEn1lRmpoQwA
         AiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=cAbwwP952kvEacD7RSRVQ9sh3+q9Zl9oRrHXxMZniwU=;
        b=JmO1dM733Hj+knUERn1EUQ00SEeBJSQal5qM/5hukxpAsfq9AwKAaHrnqFMmonnib5
         EVyw5o3EORWV5lT+SOBhQqxoupP1kZk9QII44kI6nxrkTzs/GQEJJhM5+f1zvOpNJrmz
         RfuvLzXLur/mKf8zodAh5SJwowKnPOBDuQvASXHMvrgJ6gwL6oaopX/8DXvLy2+DBPEu
         3/rs6pXDUaNUoVMen80X/R7DOP95koG9fMh36t8gINeSbFRdkhHws37ETzbrG6TbFtFE
         tHJ9NM+KgvoEf6rCxZ2xKshglGqDZrQtdAuzKU/dv+8mCNQ4omnhVyjpoNldiz7lYC3a
         SAJg==
X-Gm-Message-State: AOAM531EP1sPTsMWnt8xWafq2pnr7pxwV9huTkGzA1WwBluOdEShEJno
	OaQ+1f+STpp904VZ6/zY2Pc5TNBbLcki1Q==
X-Google-Smtp-Source: ABdhPJyx09uv+MZu7rOOt5ALrnktKXdNkG9ZPmLVW2L+frJE4bGjcZWdZOYErVuqKN7LbsYlYB3ryg==
X-Received: by 2002:a1c:a712:: with SMTP id q18mr19874986wme.23.1633946464987;
        Mon, 11 Oct 2021 03:01:04 -0700 (PDT)
Received: from ?IPV6:2620:113:80c0:8000:c::779? (nat0.nue.suse.com. [2001:67c:2178:4000::1111])
        by smtp.gmail.com with ESMTPSA id o7sm7658739wro.45.2021.10.11.03.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 03:01:04 -0700 (PDT)
Message-ID: <b1d364d0-f2ae-488b-b3f7-c694049c20d3@gmail.com>
Date: Mon, 11 Oct 2021 12:01:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek updates for v5.16
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Olof and Arnd,

Please have a look on the changes for this round.
We have support for mt8192 in the mmsys and mutex driver. Apart mmsys now 
enables it's integrated reset controller.

Thanks,
Matthias

---

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.15-next-soc

for you to fetch changes up to 605c83753d97946aab176735020a33ebfb0b4615:

   drm/mediatek: mtk_dsi: Reset the dsi0 hardware (2021-10-08 15:15:26 +0200)

----------------------------------------------------------------
- mt8192: add mutex support
- mmsys:
   add more components
   add routing table for mt8192
   add reset controller support

----------------------------------------------------------------
Enric Balletbo i Serra (2):
       soc: mediatek: mmsys: Add reset controller support
       drm/mediatek: mtk_dsi: Reset the dsi0 hardware

Yongqiang Niu (3):
       soc: mediatek: mmsys: add comp OVL_2L2/POSTMASK/RDMA4
       soc: mediatek: mmsys: Add mt8192 mmsys routing table
       soc: mediatek: add mtk mutex support for MT8192

  drivers/gpu/drm/mediatek/mtk_dsi.c     |  5 ++-
  drivers/soc/mediatek/mt8192-mmsys.h    | 76 ++++++++++++++++++++++++++++++++
  drivers/soc/mediatek/mtk-mmsys.c       | 79 ++++++++++++++++++++++++++++++++++
  drivers/soc/mediatek/mtk-mmsys.h       |  2 +
  drivers/soc/mediatek/mtk-mutex.c       | 35 +++++++++++++++
  include/linux/soc/mediatek/mtk-mmsys.h |  3 ++
  6 files changed, 199 insertions(+), 1 deletion(-)
  create mode 100644 drivers/soc/mediatek/mt8192-mmsys.h
