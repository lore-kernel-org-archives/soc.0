Return-Path: <SRS0=fPsC=MF=lge.com=chanho.min@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171D1C4345F
	for <soc@archiver.kernel.org>; Thu,  2 May 2024 05:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ABA2EC4AF1B; Thu,  2 May 2024 05:30:51 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
	by smtp.kernel.org (Postfix) with ESMTP id 9EDB4C4AF1A
	for <soc@kernel.org>; Thu,  2 May 2024 05:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9EDB4C4AF1A
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.51 with ESMTP; 2 May 2024 14:00:48 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO ?10.178.36.63?) (10.178.36.63)
	by 156.147.1.126 with ESMTP; 2 May 2024 14:00:48 +0900
X-Original-SENDERIP: 10.178.36.63
X-Original-MAILFROM: chanho.min@lge.com
Subject: Re: [PATCH] arm64: dts: Add/fix /memory node unit-addresses
List-Id: <soc.lore.kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>, soc@kernel.org,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Khuong Dinh <khuong@os.amperecomputing.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Robert Richter <rric@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20240430191856.874600-2-robh@kernel.org>
From: Chanho Min <chanho.min@lge.com>
Message-ID: <a5a4063c-9ae9-9d3d-de28-51e4220ef139@lge.com>
Date: Thu, 2 May 2024 14:00:47 +0900
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20240430191856.874600-2-robh@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/1/24 4:18, Rob Herring (Arm) wrote:
> '/memory' nodes always have a 'reg' property, and therefore should have
> a unit-address with just plain hex (i.e. no commas). Fix all the arm64
> '/memory' nodes.
> 
> It's possible that some bootloader depends on /memory (arm32 ATAG to DT
> code does for example). If so, the memory node should be commented with
> that requirement.

>   arch/arm64/boot/dts/lg/lg1312-ref.dts                  | 2 +-
>   arch/arm64/boot/dts/lg/lg1313-ref.dts                  | 2 +-

Reviewed-by: Chanho Min <chanho.min@lge.com>

