Return-Path: <SRS0=Mioa=IJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14EFC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 22:50:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5112364F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Mar 2021 22:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5112364F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kv1shpJHSy9Z2O3Lm02AVBzuofOtQa+tUNg/pyQTnuo=; b=OpyIjqpXd31paA4p3EdBiULJx
	vKymSlkErI41aN2/Jh5mmMn381eVa5HQRupdaw28Ba9qKTMblVv/QNgPFOcGlURDHGb4Mu1qp1QNN
	j4nnrclWc1Egvew0z7tZ/MlTlOPcU2CsBeT9eAzhHlemGDXHcAlVl7v1XRuU9EcV7nVFFfKuaa+Vl
	W3a0xlYQL/3EL0HLkbJ6ClFihbJgLKADAYbmeDzSVDzTMAUsaNIJtWUyqVxufidWqAD66CMKXjwXU
	oRhMcPJbvSLlQIObhzX5wGlk6AQ73rM5bzdnT64ilPxpxVjWtM+R7Nfg1na+tmtdHKqOfTCaGI+zM
	BSCwat2jA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKU6K-00ABSk-B9; Thu, 11 Mar 2021 22:48:16 +0000
Received: from mail-pg1-f174.google.com ([209.85.215.174])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKU6F-00ABS3-9Z
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Mar 2021 22:48:13 +0000
Received: by mail-pg1-f174.google.com with SMTP id n9so13645505pgi.7
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 11 Mar 2021 14:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yp/zf/TAjp/DgsBtmkn2h95rlPfAql88KAJ1HBTmgds=;
 b=qpkFMjk9e2bXJ3Drx7AZGDLslwud1RUAXs7NdRku3kzqRJRe1JAi/YZUfANBvjRfbM
 SYshy1HELOCWepToD3RUeUdSoIx+78vAUj2f4BBP8xORa/Yavv61RJ/WB0sIffYOqhaD
 w90J+2QKeYCUFgKPQnt0Wz2yKoj9Y3NM/077skijp6hsXkjzcjSgvoC2FPGs4ltKb6Ra
 idJIWT3RqaQKe3/7asKG2ozEoOzBYCPt55hA+umb1ieb00ZqdE519ouMGhxYNs6wR1U/
 QnaLl0py3t9SohGeO0n49yyfUpv4Ss6WJX4gHmHf+UZiU4wPeZ1tKSeBxgrkLuiCgQQk
 y+dA==
X-Gm-Message-State: AOAM532SQVSZKZQmaGz/PRkDj8QBbxuyiRCoklJXrrVwqbasvP0DWhz1
 M6XHKRQ3XCMIBoXtyrlVj3M=
X-Google-Smtp-Source: ABdhPJz8cvoO7cjx+Ydi2AzXzvDOKfJqCw7+rk33vFgwXIa9cNT/DNeCu3LAtFW6UsvUmJpd+zx4VQ==
X-Received: by 2002:a63:5c1e:: with SMTP id q30mr8763269pgb.259.1615502887491; 
 Thu, 11 Mar 2021 14:48:07 -0800 (PST)
Received: from localhost ([2601:647:5b00:1161:a4cc:eef9:fbc0:2781])
 by smtp.gmail.com with ESMTPSA id n10sm3227074pgk.91.2021.03.11.14.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 14:48:06 -0800 (PST)
Date: Thu, 11 Mar 2021 14:48:05 -0800
From: Moritz Fischer <mdf@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
 Lee Jones <lee.jones@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 12/15] fpga: altera: use ARCH_INTEL_SOCFPGA also for
 32-bit ARM SoCs
Message-ID: <YEqeJSFnQJVV15P1@epycbox.lan>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152735.1318487-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311152735.1318487-1-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_224811_481499_480C07F9 
X-CRM114-Status: GOOD (  20.52  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210311224805.9DqhQ8A9kg2pwa1jI9__B0OToxkBXe9ieEwEog0w548@z>

Hi Krzysztof,

On Thu, Mar 11, 2021 at 04:27:35PM +0100, Krzysztof Kozlowski wrote:
> ARCH_SOCFPGA is being renamed to ARCH_INTEL_SOCFPGA so adjust the
> 32-bit ARM drivers to rely on new symbol.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Moritz Fischer <mdf@kernel.org>
> ---
>  drivers/fpga/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
> index fd325e9c5ce6..b1026c6fb119 100644
> --- a/drivers/fpga/Kconfig
> +++ b/drivers/fpga/Kconfig
> @@ -14,13 +14,13 @@ if FPGA
>  
>  config FPGA_MGR_SOCFPGA
>  	tristate "Altera SOCFPGA FPGA Manager"
> -	depends on ARCH_SOCFPGA || COMPILE_TEST
> +	depends on ARCH_INTEL_SOCFPGA || COMPILE_TEST
>  	help
>  	  FPGA manager driver support for Altera SOCFPGA.
>  
>  config FPGA_MGR_SOCFPGA_A10
>  	tristate "Altera SoCFPGA Arria10"
> -	depends on ARCH_SOCFPGA || COMPILE_TEST
> +	depends on ARCH_INTEL_SOCFPGA || COMPILE_TEST
>  	select REGMAP_MMIO
>  	help
>  	  FPGA manager driver support for Altera Arria10 SoCFPGA.
> @@ -99,7 +99,7 @@ config FPGA_BRIDGE
>  
>  config SOCFPGA_FPGA_BRIDGE
>  	tristate "Altera SoCFPGA FPGA Bridges"
> -	depends on ARCH_SOCFPGA && FPGA_BRIDGE
> +	depends on ARCH_INTEL_SOCFPGA && FPGA_BRIDGE
>  	help
>  	  Say Y to enable drivers for FPGA bridges for Altera SOCFPGA
>  	  devices.
> -- 
> 2.25.1
> 
Thanks,
Moritz

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
