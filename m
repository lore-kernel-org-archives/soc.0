Return-Path: <SRS0=to4Y=IC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBCDC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Mar 2021 00:25:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A98B64E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Mar 2021 00:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A98B64E68
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cbunflgg1szBIBKHNjaziMflwKyMJRQdVZ59n7UC3HI=; b=m60Ko3oNAh+xIkzFe+KHDisO+
	zBcvtq63kh29MGCDmymtaoyf3zbZ1aFAXkZsREeN6v9Wv4IHPfsYdGdHv9YOpMMkVDXS+zXuyqSDD
	Bim9fo+4O2BsITYvvG6ytI4VL551epYRlxCmq1cF3Qf9bzEYQqw9N9Wrzzw2ELzC88PZzSAwO68Ri
	qtNtIaydPoOe/RXea4mPG0nxGF9hFiQDTaMjeXCYdU2QLAPVgdCcNDA6qL1uty3wJ0a2BHwaM4wI1
	M7+niod9ZQb5+OPT00H/muxTPbX4Py2JoOarYql+63LiRfK2ed2btrYC0kqMb9CQ+m/5EvVl80sgq
	LvdTSTslQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHbkc-0078O9-4r; Thu, 04 Mar 2021 00:21:58 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHW22-005ycM-My
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Mar 2021 18:15:37 +0000
Received: by mail-ej1-f44.google.com with SMTP id ci14so25023867ejc.7
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 03 Mar 2021 10:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L75O0W+60sA8PCw5vctCVfCnPFx9Df6RaLcl8AjpdUk=;
 b=cmVWWHC1NYXkqm18X/BRVZf0XNp2cSR7XTvCwN9DmDNvKagAGwOKChDzUMiLUe9mrd
 Wv0dq20qZ/RdPUghIMCO4q7A/eGoNnf4nJVJg4eccLz27khovdLopoA1/UaxvwcHyCXL
 m4a9uVn740O87VmIof8rDop6jLGfRJKlt3kNonnrdhdbi4Ga4KZsfNV2tF7Emj24IbDQ
 g0TiOmL6kBwKO2fnE+dFTws8HR0Zeosio6GLC4fNpXtswD7pSkF/nl05axLZsp8n7vRp
 ROeHtINhJHa5DKQu99FBLPgOvNgaFxcSa0qCR4Y0JJn8dNmZvz+0JvEX/z/BOf/7cHyJ
 WYGQ==
X-Gm-Message-State: AOAM53351GUpIvRb4issRT3Pr5HHOIJiP1TFeSOwpgI28lk75bXGNPON
 CWWPuWgVVb4/adGf31WzYS5DdYXhz8k=
X-Google-Smtp-Source: ABdhPJyv9ZHoKKrSfAYG3E0t2WiB0w2EQIFOB2iy2f5mHjXqT5rXzjkL15BWUuBoI/U9Tncs2D1Ixw==
X-Received: by 2002:a17:906:4c56:: with SMTP id
 d22mr110677ejw.426.1614795332589; 
 Wed, 03 Mar 2021 10:15:32 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id t15sm19739654edc.34.2021.03.03.10.15.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 10:15:31 -0800 (PST)
Subject: Re: [PATCH 03/11] arm64: dts: intel: socfpga: override clocks by label
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
References: <20210210171823.333802-1-krzk@kernel.org>
 <20210210171823.333802-3-krzk@kernel.org>
Cc: devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <e9a88bad-fb08-f028-bfe1-6d008dbfe1de@kernel.org>
Date: Wed, 3 Mar 2021 19:15:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210210171823.333802-3-krzk@kernel.org>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210303181531.TumsJ3RDsLTMii2Q8sN5iZ5Z0fyQYFuQej6TM-ym-q0@z>

On 10/02/2021 18:18, Krzysztof Kozlowski wrote:
> Using full paths to extend or override a device tree node is error
> prone.  If there was a typo error, a new node will be created instead of
> extending the existing node.  This will lead to run-time errors that
> could be hard to detect.
> 
> A mistyped label on the other hand, will cause a dtc compile error
> (during build time).
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts   | 12 ++++--------
>   .../boot/dts/intel/socfpga_agilex_socdk_nand.dts     | 12 ++++--------
>   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts      | 12 ++++--------
>   3 files changed, 12 insertions(+), 24 deletions(-)

Hi Arnd and Olof,

There was no response from Intel SoCFPGA maintainers for the DTS 
patches, so maybe you could take it directly? I can provide you pull 
request with these, if that's preferred. They apply cleanly.

You could also take the dt-bindings 2/11 or it could go via Rob.

About the defconfig patch (1/11) I will work on it more and resend it 
with your comments (you gave me review).

Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
