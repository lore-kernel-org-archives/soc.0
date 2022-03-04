Return-Path: <SRS0=1xZH=TP=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF46C433F5
	for <soc@archiver.kernel.org>; Fri,  4 Mar 2022 10:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0D38C340F2; Fri,  4 Mar 2022 10:08:48 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FB6FC340E9;
	Fri,  4 Mar 2022 10:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3FB6FC340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ay10so11891862wrb.6;
        Fri, 04 Mar 2022 02:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=5lH9FqmB9r27huwrwW03QkyzKv1cGa4Cdi1lEm6ZGVs=;
        b=oiCasSmZxW2Niq+7NicKuNDvP1EG9NDcBZbRbVAspDOimseyXnfPjZMJg1Tl03lFu3
         kHk0nHxMtLaa0PshDNs7KNWNa154VbZtJw5nlx8PXip1llrCJEFQOomMyQbhdXm2jIzF
         0y50BIdoyKOK3+uuqaPcQBxHeB8lcXNnV/npoN92NaeV/tavfOJ+xp4OAYvnQX8frHP3
         IlqQyLOs+VSwfFhwMJR7xzIXWAFlW30QsLT8BkNpdTMuBB1VYuz1RXleBoxA0Fc2TtMU
         Y2yW33Lp3Oa1F/XORTiwINqxz/g/naHFy+47jLj0lZYfDHXdosj5cAzmwhuPF0O4xIbf
         yLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=5lH9FqmB9r27huwrwW03QkyzKv1cGa4Cdi1lEm6ZGVs=;
        b=hFze1rXaR6OY4N/F1f07CuyPtj7F9DOeCL289Phf9W5j/URYg2Dgqhng2/JGg115Jl
         mCIh/0ndeMooe9nhdq4wvGl4AitudyWJJ6x4q7C1JRGK/pYiO2uQS8T3en2vr8gYrC/Y
         4SD4Izj8E0lHJKx0n2lYAI0k3i3QrLtNsugdVEz6ey4Qm7vpUDsApsVQl6TnlhdrITny
         0MA90r+JvuCTughBpxOV5hvsxMkfOVFSUagfYOXv10QGczcIabCCbBNV95+ttZL5NP+E
         H93fFKsrfVKAqsuX8ktjnWp9UO0CiSQH7ql4RFbz8XqVQjhHRiBwf1+p+QwfOcpPmjwB
         dXew==
X-Gm-Message-State: AOAM532F8tYv4dDlhTrUxl0Yt+YKZhMgwBBOuOTHGVukl0L25UuyRMQF
	OnvScbJaYR1wZbNDErnSAHYFtOiQ8NPC7w==
X-Google-Smtp-Source: ABdhPJwp5wNbI4cvDR43Kvv9DlnKNh5I8meYl21cLGp/ukDe3dnegTeeYf/twNdlW17bK1I50Ud66Q==
X-Received: by 2002:adf:fcd0:0:b0:1ef:31fe:d08e with SMTP id f16-20020adffcd0000000b001ef31fed08emr27563175wrs.667.1646388526465;
        Fri, 04 Mar 2022 02:08:46 -0800 (PST)
Received: from [192.168.0.14] (static-63-182-85-188.ipcom.comunitel.net. [188.85.182.63])
        by smtp.gmail.com with ESMTPSA id q14-20020a1cf30e000000b0038986a18ec8sm447269wmq.46.2022.03.04.02.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 02:08:45 -0800 (PST)
Message-ID: <e1b90372-a041-db6e-f35a-d17b26069e40@gmail.com>
Date: Fri, 4 Mar 2022 11:08:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] drivers: soc: mediatek updates for v5.18 take 2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,
Hi Olof,

This pull request fixes the compilation error in the mmsys driver. Sorry for the 
incovennience.

Regards,
Matthias

---
The following changes since commit eb1b02bef52ae545d5eb24116d5c099f738d39d5:



   dt-bindings: arm: mediatek: mmsys: add support for MT8186 (2022-03-01 
09:26:56 +0100)



are available in the Git repository at:



   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.17-next-soc.2



for you to fetch changes up to 62dc30150c06774a8122c52aedd0eddaceaf5940:



   soc: mediatek: mmsys: add sw0_rst_offset in mmsys driver data (2022-03-04 
10:15:47 +0100)



----------------------------------------------------------------

mmsys: fix compilation by adding SW reset infrastructure



----------------------------------------------------------------

Rex-BC Chen (1):

       soc: mediatek: mmsys: add sw0_rst_offset in mmsys driver data



  drivers/soc/mediatek/mt8183-mmsys.h | 2 ++

  drivers/soc/mediatek/mtk-mmsys.c    | 6 ++++--

  drivers/soc/mediatek/mtk-mmsys.h    | 3 +--

  3 files changed, 7 insertions(+), 4 deletions(-)

