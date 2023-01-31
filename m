Return-Path: <SRS0=wYM+=54=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853F5C38142
	for <soc@archiver.kernel.org>; Tue, 31 Jan 2023 10:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46925C433EF; Tue, 31 Jan 2023 10:56:07 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA1D9C433D2
	for <soc@kernel.org>; Tue, 31 Jan 2023 10:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA1D9C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-ej1-f44.google.com with SMTP id hx15so20856597ejc.11
        for <soc@kernel.org>; Tue, 31 Jan 2023 02:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxRToB70491st+LdnrmafgQlnLHPgXktyd3RX0RXFig=;
        b=DTxsOn1HABd1qDaqF4xrpqaZc8ZqlnpjmqAlqKwbSTv3TV/QKo5Oqli0Ok4O6wQZnq
         pfn0kSoFunz4vMRR/WGeyZf6+SgSswwWnET114nGTAU4cYfW3LXh7zJ0kZw4DFkZYWE7
         gYv0l+mE8ieZiu+IUtBHhk9Z/J8HxeU/iMWm3cmBcYuiEgSSXhusD0P5cIeV1hj+fVGg
         K0obVOiTu6IPuYLvPpsjno7Dh6Hcgca9kqbQSaaFm7K2HX8oSVeFR14NJgB/4GhDwVWb
         drxnli8xxiUEORqT/soG7P8BHy3p0gRjW38XYB/HHIjAkd6cknGoLgE1qrE+iGE6vUQp
         xuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uxRToB70491st+LdnrmafgQlnLHPgXktyd3RX0RXFig=;
        b=KWP8RMXzDWsYgWYOttEce+VrTE7tQT6Q3sPq3bc0xvNlq1C2AopdKNS/16IJ2dR3ZM
         1e5WB/GGGEiwqefqcbW3o+kkK+2oqPHRQTJ95qW+uHiRI+rCD7LJtLtnr8qKReBqa2S9
         mVbi0KVFOihDKTjpMH34+6FtVj87U3A7cif6HohSfNeEFbey9RKlSTCNfC1b3dsw10LP
         yM8/VKCEwQc4kNxfZ0SURQyQm9kHivwcfR5goTebkoceENjWNuhkuFDyImChQTfrTpCZ
         0f8nXK1QPl1gXevwdufCYBtYPmW4YLPBqVoDf8F5sCNu1BzzBVTifUJvc5SrpiPYDuOn
         iDMg==
X-Gm-Message-State: AO0yUKUGqa1GwmPrER0G7fJCktTzxrQ8gEvRVP0L7meG4BAH2WxNmolg
	R1+1nGztt3CZQhRrjmv2tM5jSU5AsGLm+6sc
X-Google-Smtp-Source: AK7set80EKGqZC+zoqZBsG9VuTgqF6V0+xOAuhOb4fbZEtx4MSeAiZlMeC3WXr1o+IEFtUIterxr5g==
X-Received: by 2002:a17:906:e08e:b0:889:1480:d908 with SMTP id gh14-20020a170906e08e00b008891480d908mr2900382ejb.17.1675162561081;
        Tue, 31 Jan 2023 02:56:01 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id e6-20020a1709061e8600b0085e0882cd02sm8317752ejj.92.2023.01.31.02.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 02:55:59 -0800 (PST)
Message-ID: <89d82a7e-6b42-97ce-2912-aa7dec965ff2@monstr.eu>
Date: Tue, 31 Jan 2023 11:55:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: "git (AMD-Xilinx)" <git@amd.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: dts: ZynqMP DT changes for v6.3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

please pull these DT patches to your tree.

Thanks,
Michal


The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-v6.3

for you to fetch changes up to b993ea2b75fdb0d335487b1b1450c36410585584:

   arm64: dts: zynqmp: Add xlnx prefix to GEM compatible string (2023-01-19 
14:03:32 +0100)

----------------------------------------------------------------
arm64: ZynqMP SOC changes for v6.3

- Fix node names to be aligned with dt schema
- Rename DT overlay files to dtso
- Add snps,resume-hs-terminations to usb nodes
- Describe gpio-modepin node
- Use xlnx prefix for ethernet IP

----------------------------------------------------------------
Andrew Davis (1):
       arm64: dts: xilinx: Rename DTB overlay source files from .dts to .dtso

Harini Katakam (1):
       arm64: dts: zynqmp: Add xlnx prefix to GEM compatible string

Krzysztof Kozlowski (1):
       arm64: dts: xilinx: align LED node names with dtschema

Michael Grzeschik (1):
       arm64: zynqmp: Enable hs termination flag for USB dwc3 controller

Michal Simek (2):
       arm64: xilinx: Fix opp-table-cpu
       arm64: dts: zynqmp: Remove clock-names from GEM in zynqmp-clk-ccf.dtsi

Piyush Mehta (1):
       arm64: dts: zynqmp: Add mode-pin GPIO controller DT node

  arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi 
     |  4 ---
  arch/arm64/boot/dts/xilinx/{zynqmp-sck-kv-g-revA.dts => 
zynqmp-sck-kv-g-revA.dtso} |  0
  arch/arm64/boot/dts/xilinx/{zynqmp-sck-kv-g-revB.dts => 
zynqmp-sck-kv-g-revB.dtso} |  0
  arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts 
     |  2 +-
  arch/arm64/boot/dts/xilinx/zynqmp.dtsi 
     | 28 +++++++++++++-------
  5 files changed, 20 insertions(+), 14 deletions(-)
rename arch/arm64/boot/dts/xilinx/{zynqmp-sck-kv-g-revA.dts => 
zynqmp-sck-kv-g-revA.dtso} (100%)
rename arch/arm64/boot/dts/xilinx/{zynqmp-sck-kv-g-revB.dts => 
zynqmp-sck-kv-g-revB.dtso} (100%)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs


