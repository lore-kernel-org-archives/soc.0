Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A579CC433EF
	for <soc@archiver.kernel.org>; Sun, 13 Feb 2022 01:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48A5CC340F0; Sun, 13 Feb 2022 01:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D480BC340E7;
	Sun, 13 Feb 2022 01:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644714490;
	bh=b4lzABc52UQ97AYu4J/VfxIBBhkmcUzn55xMCVS+Krs=;
	h=Date:Subject:List-Id:To:References:From:In-Reply-To:From;
	b=KMBIMxw0arbvzXo3z+PtHTsBNxhxArAONEfsEufJ5Vp5KAsLG5zV1C12+Qq3E0sch
	 j+UQomNQh6VszxCFisJpBTzbFjdVK5EAvkj516XqHGpDmHtPNKQUPhP/BEEKB5jpI0
	 Mwze0FMAePcMN77Nu1HXeusUKxQjDKSR2tRCqP2SgOk59Ww37Vw5hTpOtBz7K/DjXr
	 mVe4ZvCVY6+4ppC7qg7KDu8Lwu4sS77y4lqR4Ry4eKgfzM1IHd4Kmdtutn+PVCsrtb
	 bDZbcNdSK/Nm8xkcXJ6G94Rw5Sd/GI4Lq0QBq5iKqxowDJr+nflOeu9iA1hrj+mwD4
	 O+F5tOp1ore4Q==
Message-ID: <d55e89ed-3c7d-70d4-a1da-088cf05885c8@kernel.org>
Date: Sat, 12 Feb 2022 19:08:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [GIT PULL 2/2] arm64: dts: socfpga: dts updates for v5.17, part 2
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
References: <20220211112556.98940-1-dinguyen@kernel.org>
 <20220211112556.98940-2-dinguyen@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20220211112556.98940-2-dinguyen@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this pull request. It looks like Greg KH took these 2 
patches into the USB tree.

Thanks,
Dinh
On 2/11/22 05:25, Dinh Nguyen wrote:
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>    Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_update_for_v5.18_part2
> 
> for you to fetch changes up to 268a491aebc25e6dc7c618903b09ac3a2e8af530:
> 
>    arm64: dts: agilex: use the compatible "intel,socfpga-agilex-hsotg" (2022-02-09 13:18:48 -0600)
> 
> ----------------------------------------------------------------
> SoCFPGA dts updates for v5.18, part 2
> - Add the "intel,socfpga-agilex-hsotg" compatible for Agilex platform
> 
> ----------------------------------------------------------------
> Dinh Nguyen (2):
>        dt-bindings: usb: dwc2: add compatible "intel,socfpga-agilex-hsotg"
>        arm64: dts: agilex: use the compatible "intel,socfpga-agilex-hsotg"
> 
>   Documentation/devicetree/bindings/usb/dwc2.yaml | 1 +
>   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi   | 4 ++--
>   2 files changed, 3 insertions(+), 2 deletions(-)
