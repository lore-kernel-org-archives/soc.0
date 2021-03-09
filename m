Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5580C433E0
	for <soc@archiver.kernel.org>; Tue,  9 Mar 2021 13:30:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 741F764F62; Tue,  9 Mar 2021 13:30:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 197F864F35;
	Tue,  9 Mar 2021 13:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615296658;
	bh=iGtdU+6GSxlqPB9V2HpM8TOGhILqr2eIHzs21JyFqAc=;
	h=Subject:List-Id:To:Cc:References:From:Date:In-Reply-To:From;
	b=KjbmQcph/FialNjZLvDWMKRCnbHJ2Wv7vsTNrKQok1R5NnnnYyJ3JfsO2ZkXNgjAh
	 Pv8wkEAoryo4vPynzXCZKqphJ2qZQsocqq0dv0vm4+iTy6gFH2SWPYiD5NQUkGq1o5
	 vvnc3KnqGxCGqVe3xkS2wtfxAIgi5sLcsnFevmHTzrp7jpK7F8nitCQuHengucN9NA
	 SW6UddM6JGDefysyhL9VaQ9mi3i7HTGamw+Fyu4iV8e05yOoX7rb7emDYK+wx3GVOD
	 Rm6hL05BimijXcWW4cpP4d5x/Q7CWItwkT6ZR+S5G12iZKinoGI9YzvbvfXfGlPdwg
	 LF8MMt4SIQXSQ==
Subject: Re: [RESEND 2nd PATCH 00/10] arm64: dts: intel: socfpga: minor
 cleanups
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, arm@kernel.org, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
References: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <b1b65ce5-ac1b-3a4b-5233-8c5fa50f9b2f@kernel.org>
Date: Tue, 9 Mar 2021 07:30:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/8/21 11:09 AM, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Hi Dinh, Arnd and Olof,
> 
> This is just a resend of previous patch.
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (10):
>    dt-bindings: arm: intel,keembay: limit the dtschema to root node
>    arm64: dts: intel: socfpga: override clocks by label
>    arm64: dts: intel: socfpga_agilex: move clocks out of soc node
>    arm64: dts: intel: socfpga_agilex: move timer out of soc node
>    arm64: dts: intel: socfpga_agilex: remove default status=okay
>    arm64: dts: intel: socfpga_agilex: move usbphy out of soc node
>    arm64: dts: intel: socfpga_agilex: use defined for GIC interrupts
>    arm64: dts: intel: socfpga_agilex: align node names with dtschema
>    arm64: dts: intel: socfpga_agilex_socdk: align LED node names with
>      dtschema
>    arm64: dts: intel: socfpga_agilex_socdk_nand: align LED node names
>      with dtschema
> 
>   .../bindings/arm/intel,keembay.yaml           |   2 +
>   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 222 ++++++++++--------
>   .../boot/dts/intel/socfpga_agilex_socdk.dts   |  18 +-
>   .../dts/intel/socfpga_agilex_socdk_nand.dts   |  18 +-
>   .../boot/dts/intel/socfpga_n5x_socdk.dts      |  12 +-
>   5 files changed, 144 insertions(+), 128 deletions(-)
> 

For the whole series that involves socfpga, feel free to add:

Acked-by: Dinh Nguyen <dinguyen@kernel.org>

Thanks,
Dinh
