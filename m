Return-Path: <SRS0=6MTT=QT=quicinc.com=quic_vamslank@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522EAC433FE
	for <soc@archiver.kernel.org>; Thu,  2 Dec 2021 00:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 05BEDC53FCC; Thu,  2 Dec 2021 00:35:02 +0000 (UTC)
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 424ACC00446;
	Thu,  2 Dec 2021 00:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 424ACC00446
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1638405301; x=1669941301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tigB941sFJ2JS9XqW/Csq5Ad1Iz966W6LuwZoun7X4c=;
  b=SW1Jc1U+CLc2X9CbD9y1x6GYThxeNQReD7Ugkf4H58t8eq/ig9MzEKAQ
   1sgDEA9ztPpDWXXTxWUGyr4vLtg7rtsGolZcyPF2avlqfEiE7Couemdsr
   35HZVvnkveZmiKGkNub+DBAg7KDbesq6g57837IzytgfsNp8mzHYGQ2Qw
   0=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Dec 2021 16:35:00 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 16:35:00 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 1 Dec 2021 16:35:00 -0800
Received: from quicinc.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 1 Dec 2021
 16:34:59 -0800
Date: Wed, 1 Dec 2021 16:34:58 -0800
From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
List-Id: <soc.lore.kernel.org>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <olof@lixom.net>,
	<soc@kernel.org>, <linus.walleij@linaro.org>, <sboyd@codeaurora.org>,
	<robh+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 0/3] Add devicetree support for SDX65 Modem and MTP
Message-ID: <20211202003458.GA25288@quicinc.com>
References: <1635552125-16407-1-git-send-email-quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1635552125-16407-1-git-send-email-quic_vamslank@quicinc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)

On Fri, Oct 29, 2021 at 05:02:02PM -0700, quic_vamslank@quicinc.com wrote:
> From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> 
> Hello,
> 
> Changes from v2:
>  - Added cmd-db node to the sdx65 dtsi file
> 
> Changes from v1:
>  - Addressed Bjorn's comments
> 
> This series adds devicetree support for Qualcomm SDX65 platform and MTP
> board. This series functionally depends on Add Pdc, GCC and RPMh Clock support
> series [1] and Add pinctrl support for SDX65 [2] which are under review.
> 
> With this current devicetree support, the MTP can boot into initramfs
> shell.
> 
> Thanks,
> Vamsi

Can you please review this patch series. It's been pending since longtime now.

Thanks,
Vamsi
> 
> Vamsi krishna Lanka (3):
>   dt-bindings: arm: qcom: Document SDX65 platform and boards
>   ARM: dts: qcom: Add SDX65 platform and MTP board support
>   ARM: dts: qcom: sdx65: Add pincontrol node
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml |   6 +
>  arch/arm/boot/dts/Makefile                      |   3 +-
>  arch/arm/boot/dts/qcom-sdx65-mtp.dts            |  25 +++
>  arch/arm/boot/dts/qcom-sdx65.dtsi               | 222 ++++++++++++++++++++++++
>  4 files changed, 255 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/qcom-sdx65-mtp.dts
>  create mode 100644 arch/arm/boot/dts/qcom-sdx65.dtsi
> 
> -- 
> 2.7.4
> 
