Return-Path: <SRS0=zyQt=NV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBDDC432BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Aug 2021 10:47:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79FA4610FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Aug 2021 10:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79FA4610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3i/tzrgeay54Hp9BRNcDl6trl5QRzAKKICvNT4JLjCE=; b=JFvWNKJFgF9Atr
	MeWkmkxrYuM7CPZzSnEBnC8vmggfmW7veSl1zFWSA8jnSKIfk7dnE+ipIz4vR9WNMaXJIhmrNjpSB
	taG397SpjZ1EJqWNNqcGGtaOl5FjqvlDAnNjfuJPNKdMY+OLVffssBEyfxXZnARu/ykbi6iE3FufZ
	rFYns9yh4ykZFk+S0XMRtzMQL1OHywqytbcUzEcSSN2DchG4rX/2zgewkFAQkdteMxCllQ160o0MG
	eftfpwTrapkalyLt3NZgXrYhu/rdvUnKx7JD9au4OM9gd4+nC1HqlGJfZFyO3Q7vDRP76UB2Eqy1T
	P8+sdc8IMhFLyCmIfm9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKemj-00H1UF-J7; Mon, 30 Aug 2021 10:45:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKema-00H1S2-Ej
 for linux-arm-kernel@lists.infradead.org; Mon, 30 Aug 2021 10:44:58 +0000
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
 Heiko Stuebner <heiko@sntech.de>, soc@kernel.org
Date: Mon, 30 Aug 2021 12:44:49 +0200
In-Reply-To: <20210820165011.3257112-1-robh@kernel.org>
References: <20210820165011.3257112-1-robh@kernel.org>
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_034452_581061_39F560F5 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210830104449.MVnXlu_vdW02GUxKrIoxNXwa0wNVIJFLe_3h9aQySlo@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
