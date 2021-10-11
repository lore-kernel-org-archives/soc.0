Return-Path: <SRS0=AhuM=O7=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B68C433EF
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 09:55:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E436160F22; Mon, 11 Oct 2021 09:55:28 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9E5260F21;
	Mon, 11 Oct 2021 09:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9E5260F21
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id k7so54113767wrd.13;
        Mon, 11 Oct 2021 02:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=KEIQBY3yB7sFijNbITIbAy1U/OJ4y1qB7wieoUaKB/E=;
        b=XEPysK+Rjyy3n9BjU3ugmKz+veslyzHP9+UrUAGH+ZDJjYeQFIkZlkRnOblTHEIW6j
         08Ts0AF8/i4yZzWcCAKsy3Ec/jIIVCFEWcdaVkSGBcGXicCM8659+EF63b9efEZRcAju
         nYcku52ca9sHPKAPUnzXKNUwsD4QjSkDF8QvdXjTzHb4UjIJoOWg0Ik9OidYY5+9/70j
         qhd0OGdyWgAVv1KezePL25IoO/ySv9yO4JNcFm9KMQBEIb0nNLvRszH9obdUNx86wq3v
         gEYyGju93zDn6WKWvPd+oGUU7lj2GSWab3zf/sCTozflzHOGjnk+rr9N7SOKMeghRwOS
         gu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=KEIQBY3yB7sFijNbITIbAy1U/OJ4y1qB7wieoUaKB/E=;
        b=zUcpSLuA0Dta7+82YzuYxHnp6Y2hSmFlpmL+YT2iMZ9HAPRcMRAYav5t+00i4a7Sby
         dSiCt/gzqKcboBtbzSwFLJeE9kJ/IPHC9K40vvEiOP63Z1olg5mRiJtQiL79aLkQrSlK
         2r9mRaxnyLcralNodLx8DjpGPWHqN9M64kb5S/R68YWDWeDdSWrgqf8GyE8J2zk70ecg
         F4AsoxpwVazdh4Oxj6aOzORPi5OCNNsqSRbg4vOeVns/yCHQQ/3TMT+CWFWwo8124if7
         nVyEKzl3Xr1119Dym/BIDwn0cN436yZXFNP97blks2Rl2Howl1cj3OZrdt8Tm1ael80+
         P/VQ==
X-Gm-Message-State: AOAM530593uFPTlyOj9iC6kJ/hqTJ0j6ktkdCf2R9wff7yjHOdvGmZ2c
	P7Ib2BEJAzIw5ysqhFAROvD0+14S2pDudA==
X-Google-Smtp-Source: ABdhPJw0+3/W6Wqq6fe4+vkQBNKdlbk9kHb4dQMk/hWb0t6O0C2Jpfu7OsnTGuF2HQ2KpdmK/uba8g==
X-Received: by 2002:a05:6000:1b83:: with SMTP id r3mr22761183wru.240.1633946127067;
        Mon, 11 Oct 2021 02:55:27 -0700 (PDT)
Received: from ?IPV6:2620:113:80c0:8000:c::779? (nat0.nue.suse.com. [2001:67c:2178:4000::1111])
        by smtp.gmail.com with ESMTPSA id q12sm10333479wmj.6.2021.10.11.02.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 02:55:26 -0700 (PDT)
Message-ID: <7135d46f-5fb9-b46d-96d4-3b38548fe23e@gmail.com>
Date: Mon, 11 Oct 2021 11:55:25 +0200
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
 Frank Wunderlich <frank-w@public-files.de>, Luca Weiss <luca@z3ntu.xyz>,
 Sungbo Eo <mans0n@gorani.run>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: dts32: mediatek updates for v5.16
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd and Olof,

Please have look to the latest arm32 bit DTS changes.

Regards,
Matthias

---

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.15-next-dts32

for you to fetch changes up to 1b17eee4d48df3c7aa90a6ec2c9b53adaaa6776f:

   dt-bindings: arm: Add MT6589 Fairphone 1 (2021-10-08 16:33:16 +0200)

----------------------------------------------------------------
mt7623: add USB nodes
mt7629: update PCIe node to new format

----------------------------------------------------------------
Chuanjia Liu (1):
       ARM: dts: mediatek: Update MT7629 PCIe node for new format

Frank Wunderlich (1):
       arm: dts: mt7623: add otg nodes for bpi-r2

Luca Weiss (1):
       dt-bindings: arm: Add MT6589 Fairphone 1

Sungbo Eo (1):
       arm: dts: mt7623: add musb device nodes

  .../devicetree/bindings/arm/mediatek.yaml          |  1 +
  arch/arm/boot/dts/mt7623.dtsi                      | 33 ++++++++++++++++
  arch/arm/boot/dts/mt7623a.dtsi                     |  4 ++
  arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts      | 25 ++++++++++++
  arch/arm/boot/dts/mt7629-rfb.dts                   |  3 +-
  arch/arm/boot/dts/mt7629.dtsi                      | 45 ++++++++++------------
  6 files changed, 86 insertions(+), 25 deletions(-)
