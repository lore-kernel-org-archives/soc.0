Return-Path: <nsaenz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64648C432BE
	for <soc@archiver.kernel.org>; Mon, 30 Aug 2021 10:44:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 41A25610FA; Mon, 30 Aug 2021 10:44:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B1C4610E6;
	Mon, 30 Aug 2021 10:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630320292;
	bh=6+FRKsMfFe+pdayu24b/pvmxkUeuex2A7OmHflsQGzc=;
	h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
	b=h8Wud1Dghk7KAXs9XThpQEKpK6J/or0ksL/VcGsEzKqrdGQnE2DvsE4sX1Wenz/9c
	 ZLdVCIowwlA4qKHFwLDZc4zJe/pD20Keaj2KZomwtIxnGS8+c9C+Om7K6qEjCeZ2A7
	 yB8ylqHZWF9U9RKrsDhycIok/yr7w/EHet/M+k2CcALz66gxEmu0jakoCKiadOOp79
	 P7ldWnY0BtuWvr2l9tHJ08ad5sXorepyVAE18kjUD/dHa0xm5JP3phdCxBBZoyKI+l
	 K11DrAh1PAyTy/B0XnYltW9xBaOwZv1dIml+HjZEl5Hu3eJIV2D2wa+Bx83eeRmlmU
	 X+3G8mX+oO80w==
Message-ID: <0fda88b012499c40e75c74b9e3a7037e2ee3fb9c.camel@kernel.org>
Subject: Re: [PATCH] kbuild: Enable dtc 'pci_device_reg' warning by default
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Heiko Stuebner
	 <heiko@sntech.de>, soc@kernel.org
Date: Mon, 30 Aug 2021 12:44:49 +0200
In-Reply-To: <20210820165011.3257112-1-robh@kernel.org>
References: <20210820165011.3257112-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Fri, 2021-08-20 at 11:50 -0500, Rob Herring wrote:
> There's only a couple of instances of the 'pci_device_reg' warnings left
> and they look legit, so let's enable the warning by default.
> 
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
> Cc: soc@kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> These are the 2 remaining warnings:
> 
> arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi:464.3-52: Warning (pci_device_reg): /pcie@f8000000/pcie@0,0:reg: PCI reg address is not configuration space
> arch/arm/boot/dts/bcm2711-rpi-4-b.dts:220.10-231.4: Warning (pci_device_reg): /scb/pcie@7d500000/pci@1,0: PCI unit address format error, expected "0,0"

Just for the record, bcm2771 issue is being fixed here:
https://lkml.org/lkml/2021/8/30/232

Regards,
Nicolas

