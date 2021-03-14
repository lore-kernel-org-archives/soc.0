Return-Path: <SRS0=addu=IM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA85C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Mar 2021 11:54:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2983064E3F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Mar 2021 11:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2983064E3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mIyvb3f631k0jepT0h3O06I1jRSj2Ogb3V/4HGCDRQE=; b=J2IhW4AQXhlgsSj64mUv5WfkK
	tSdGkYESFEyD9De1l9nm56Q53WFE9Z9wjmf12yYREm397I6kDHveEKXPR97nzJa/HHXpALOnp8mRt
	XeSM6kSRbEs2HueXaUH0uWAj2bbTzAwXcNDyRKsV01t4tXwY4A7a/YM5PJlJi++RKKiqJ7f6Uiwfk
	DDA0hwwnXzYZHh33IW4LqAID/ZEzsV9ZESNHWFLtnt1XY524iqV+zgKKZmfgRiWIWThH2jKE1LHxY
	Bg+HdUMbDb5/YGsMeNdUGtgx/9L0CXnTjULYdVdnx5oPAuTtFqRUQrj7nrni8CF64u2W4Lv/lPu1H
	1APPEBJvA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLPIg-00EAEv-FY; Sun, 14 Mar 2021 11:52:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLPId-00EAEc-DY
 for linux-arm-kernel@lists.infradead.org; Sun, 14 Mar 2021 11:52:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79D0F64E21;
 Sun, 14 Mar 2021 11:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615722763;
 bh=zz0j1vSP+mihmyWSjFGBpWwyLWTagQ1U8k3YP/B+t50=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=S5QRD6XZIPv87arcP1TrVHk8Q1o4GY5GzRH1CaAa4f5vf0gZc18rfVYZ6eCrVn/Ic
 9bVR/0oriW1L/JPIfFW5Ir9aYUkQtxKVXeFPD3Y5HIGso77iy2HXIDcxT4WcumhiOw
 rJgEQbr8n7uxu+FsRYy3RH0BFRVoyCE8lHiHdgVVhYKiS8QJtjJwwx1nawBk6yZ5Nn
 hDTcUTWjhoAM9aiqnPqPs9P1iZ0BXUzv3xb4FxGKxSmIFxFj9odphZTVPkmRiHAKOf
 rpdghBhgafT1BYWFkM9YPfvyv1Iny5ONg7V5vj7dNdIxd3afUVzAE7tJKDvhl3jNQA
 nmgzDrVk8jsdw==
Date: Sun, 14 Mar 2021 17:22:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
 Robert Richter <rric@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Tom Rix <trix@redhat.com>, Lee Jones <lee.jones@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 11/15] dmaengine: socfpga: use ARCH_INTEL_SOCFPGA also
 for 32-bit ARM SoCs
Message-ID: <YE35Bw/DHRz63RBT@vkoul-mobl>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152731.1318428-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311152731.1318428-1-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210314_115247_704259_D1A0310B 
X-CRM114-Status: UNSURE (   7.15  )
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
Message-ID: <20210314115239.sXByGQ0DfQYNSHgLZeEWoIzLoR96uq_J5UglIfuxh9k@z>

On 11-03-21, 16:27, Krzysztof Kozlowski wrote:
> ARCH_SOCFPGA is being renamed to ARCH_INTEL_SOCFPGA so adjust the
> 32-bit ARM drivers to rely on new symbol.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
