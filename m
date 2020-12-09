Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15854C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 15:00:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B985B23A5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 15:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B985B23A5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5zB38zUBJSjCpfl0L/KEkgD+VY9IrMthlOBNWWhpXHE=; b=AOfhU6GeO7C6BgS7cgo61k2Ls
	a44cgxn05rqAcKB97F2w+2AT7C63+EA8UkK21xgzlTH127PTphWCFhvCRoD21su5x9UHHQAWBYeCI
	SEkwXGaK/vl6D4sAKRiooyMYhkEL4tPUOBG4Hd8U7JyXsu8Qq6y1cTwUBb8HldK+mrYWQKUfCEryc
	+l/jOdKKcixAHXKTTF9PawyuABstH+sZNF828JiEeSlak9CrOJZRl0FkTgoJ4nh3oxMk600CkySCd
	u6tBarDkemqK9AmwFu5pYTEUEvamq7cFmy6MKt4UM0bwnCIQ3QtvV5FeJ93PtJLwmDc6Udjt4fIT8
	d5U6IDYhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn0vt-0000SR-7R; Wed, 09 Dec 2020 14:59:09 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn0vq-0000Re-NW
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 14:59:07 +0000
Received: by mail-ed1-x544.google.com with SMTP id c7so1883268edv.6
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 09 Dec 2020 06:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KL0awVMGq+7AIaF+tfYIdv1gdKJRQiKFD7DSD7bud5M=;
 b=icE3s25uMMbyNDXGP1rV9fLEuhx5cWNCtRFlTPu7bViPOUIpQJVQBCYUbUvdzF6vts
 TMa7NfnOK3/IKZ3+2SFre/aOypskVfucRprNdNKII0Y2hY/RNZ75nMzeFAG8iMbdxIrV
 l41x1XTCMgcdwUy1KxPLdsHkw+JW03zdpmZrEV4hu62Ljr0CppAC3PpPP4mA9Sg3r43o
 1SvU7iwe/vGR4IlkSSkyYqfJHWqsHG68olhiaEUy3E7+ZLW8UtlzHC+6hi6kjiIiYZw0
 bSVyH7k/3dOS41CFfjD4lc64jKb5bbSQmeGrv2P7fFOqAUSMSt0SOGW+j5qCTIpvHXhj
 tvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KL0awVMGq+7AIaF+tfYIdv1gdKJRQiKFD7DSD7bud5M=;
 b=dHNTKoZ2DXCp2YhJyRG9zReE6N2ae1FM5v2OzIOYUl1d37OasuOvXTbDIMEVsysCn7
 2VYyU57SUHwElQ4XgFfHWVk6r7ZbRkfDlZ1vD0RTaryERR4ZgKOI0QWTIcEywyI0YoR8
 EatzIn8m3Lqh10ziK93BnLQVmLRL0DLZqdhPwtz8EUR6YWAYaAXEoeN275v6TZQB6vIf
 4SL8NdXj9moMFR6G9e5O6V0QNAB3JIdQI7k42MvCGLNRLqf4cjT2lNIdqKSCplZFUoR/
 OA2EtupNA6sMD/lGr/wYUyJSA9aDkke/XtscixL+ILLyQF1MPiLPZc24b5b31bDzC8J0
 jabA==
X-Gm-Message-State: AOAM530dwcgoS/9abeirsKoI+LieKZXloe8kzZ1XIDVyvgFG4pOg/jE/
 dhYyKcft6V4Bg/8kkRY+cSVdCw==
X-Google-Smtp-Source: ABdhPJxphQMAX3SOytIqoZp+DlI4PcCk/oJtY0lB2iJjnb9Yw0CIrFtAhYmctqtle48I1KowIBa0QQ==
X-Received: by 2002:a50:e00b:: with SMTP id e11mr2367934edl.303.1607525945660; 
 Wed, 09 Dec 2020 06:59:05 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id h15sm1768858ejq.29.2020.12.09.06.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 06:59:05 -0800 (PST)
Subject: [GIT PULL] arm64: soc: ZynqMP changes for v5.11 (was Re: [GIT PULL]
 ARM: dts zynq: Xilinx DT changes for v5.11)
From: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
References: <752fc10f-c2eb-736e-8a11-13e770f50c90@monstr.eu>
Message-ID: <075b91c3-a434-4894-d4aa-d10329645980@monstr.eu>
Date: Wed, 9 Dec 2020 15:59:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <752fc10f-c2eb-736e-8a11-13e770f50c90@monstr.eu>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_095906_795597_01EE3C6A 
X-CRM114-Status: GOOD (  21.16  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209145904.cYGw9X-p_o5pz6pWcQJj_Tz7XMTqEOx0hC_QLrdVv38@z>

Hi,

pull request below is correct. I just used incorrect subject line (c&p
error). Sorry about it. Please let me know if you want to send it again.

Thanks,
Michal

On 09. 12. 20 15:51, Michal Simek wrote:
> Hi,
> 
> please pull the following changes to your tree. The tree is based on
> zynqmp-soc-fixes-for-v5.10-rc6 tag or acfdd18591ea ("firmware: xilinx:
> Use hash-table for api feature check") which went to v5.10-rc6.
> 
> Thanks,
> Michal
> 
> 
> The following changes since commit acfdd18591eaac25446e976a0c0d190f8b3dbfb1:
> 
>   firmware: xilinx: Use hash-table for api feature check (2020-11-24
> 15:13:54 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-v5.11
> 
> for you to fetch changes up to b8d6b5c241b3dedaa03f845e25412935fef81c6b:
> 
>   firmware: xilinx: Properly align function parameter (2020-12-09
> 15:09:11 +0100)
> 
> ----------------------------------------------------------------
> arm64: soc: ZynqMP SoC changes for v5.11
> 
> - Small alignments in Xilinx Firmware driver
> - Exposing syscon interface for VCU driver
> 
> ----------------------------------------------------------------
> Michael Tretter (4):
>       soc: xilinx: vcu: drop useless success message
>       dt-bindings: soc: xlnx: extract xlnx, vcu-settings to separate binding
>       soc: xilinx: vcu: use vcu-settings syscon registers
>       soc: xilinx: vcu: add missing register NUM_CORE
> 
> Michal Simek (4):
>       firmware: xilinx: Fix kernel-doc warnings
>       firmware: xilinx: Remove additional newline
>       firmware: xilinx: Add a blank line after function declaration
>       firmware: xilinx: Properly align function parameter
> 
> Wendy Liang (1):
>       firmware: xlnx-zynqmp: fix compilation warning
> 
> Zou Wei (1):
>       firmware: xilinx: Mark pm_api_features_map with static keyword
> 
>  Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml |
> 34 ++++++++++++++++++++++++++++++++++
>  Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt           |
> 9 ++-------
>  drivers/firmware/xilinx/zynqmp.c                                    |
> 48 ++++++++++++++++++++++++------------------------
>  drivers/soc/xilinx/Kconfig                                          |  1 +
>  drivers/soc/xilinx/xlnx_vcu.c                                       |
> 96
> +++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------
>  include/linux/firmware/xlnx-zynqmp.h                                |
> 45 ++++++++++++++++++++++++++++++++++++++++-----
>  include/linux/mfd/syscon/xlnx-vcu.h                                 |
> 39 +++++++++++++++++++++++++++++++++++++++
>  7 files changed, 187 insertions(+), 85 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml
>  create mode 100644 include/linux/mfd/syscon/xlnx-vcu.h
> [linux](zynqmp/soc)$
> 

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
