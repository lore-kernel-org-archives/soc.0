Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D12C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 17:47:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0B7F23C92
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 17:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0B7F23C92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JDS0ORFq/6ktLMo7gqv2W4D8dAjxDT2V2esXdZAUdF0=; b=1Z84nwXDHCLHoweRWu9w1/nc4
	R8w1SUtqy7tc4asCLy1mUrI1uwaNVB5IlqROOPlA2M+HmWn3RTZ9C22kGUojqIY6P+mzyPyuJm5eP
	VvoxUFPCidt/VStMRk3NY4h33OT3RQxRu+ohqUDH9IYPZz9l6VcIY/N1hCB7MMFTpgWwkrTitt/BM
	HniOE/rbQMCaRpF6bRcYEAqBvsSHoF7V/TdI+5MjiTbLUu+YWogKzM1P/n/o8a5V3F5PzRsLDQh+4
	GhaGkvpAUn0gmHDtK2MKyu4d9IFNcbXrlQabjUnkXfalOkx+bJMOJNwq7jWmxtXqPhbeLGU8+l5pD
	1xP3zNqRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn3XE-0001in-NY; Wed, 09 Dec 2020 17:45:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn3XC-0001iO-Ib
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 17:45:51 +0000
X-Gm-Message-State: AOAM530/r6k1V6CwuoN2lwNnHUMR5TB49eviOyLYX3hzodJyiW1txP/U
 k0gGKj4rulvtjBcVPIPEz+inVxUYRpWRN4fCDYQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607535949;
 bh=fIc3D8aOxqtezDWTUeH5a6/4xchyDWUNEXST3nSLAkw=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=Bpe7vKouCkRSyQ1Ipr/XuR/qzTh2MMID46Nb2CAP3lvmFw/jv/fpWNEXiFwzk3xkr
 52B1pw0+CEuyMfniqkIGXLkPAFjSdh2gqw1RYIHXZctv+5miWc6db/aqP0wynF+YSa
 urp+IReGbC4s7/C3w8j0mhMed9aqDCvZANY2cVCrbK8oc3Z7CYeKjievfw5OLlGG+6
 T0cvfK1iLGvTMBRkKuSmhkSiS2VGYSEXz0IqekscmYA4dfgf1xpFEKa5MHRs1PT2IN
 656X4hLElqW9TTzkRxoBalD/V0S+/MZ+j5nyGpYE9ukbCkL3GoFgFWyr9NyQAaUPj2
 QJerZqeaD3OVA==
X-Google-Smtp-Source: ABdhPJxI4CSXg4rYiEkbPRmEtP+i77kAz27CFNAUQJLWmwro9f063ABQy2CEN1uI6TSE7xm3IWLb5F0LaDw8Ek7pHaU=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr2759576otm.305.1607535948906; 
 Wed, 09 Dec 2020 09:45:48 -0800 (PST)
MIME-Version: 1.0
References: <20201201134330.3037007-1-daniel@0x0f.com>
 <20201201134330.3037007-2-daniel@0x0f.com>
 <20201209163536.GB566058@robh.at.kernel.org>
In-Reply-To: <20201209163536.GB566058@robh.at.kernel.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 18:45:32 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0D+XQREm7Gw5-7-byiz7eufYGT_r-XC3H6_whdOB0a1w@mail.gmail.com>
Message-ID: <CAK8P3a0D+XQREm7Gw5-7-byiz7eufYGT_r-XC3H6_whdOB0a1w@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: mstar: Add binding details for
 mstar, smpctrl
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_124550_691287_AB5AB1FD 
X-CRM114-Status: GOOD (  11.74  )
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
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Palmer <daniel@0x0f.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
 Willy Tarreau <w@1wt.eu>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209174532.gUWysfw483ZV1cbThxqSsAJjLbqHwDtotG4rucAuDew@z>

On Wed, Dec 9, 2020 at 5:35 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Dec 01, 2020 at 10:43:21PM +0900, Daniel Palmer wrote:
> > This adds a YAML description of the smpctrl node needed by the
> > platform code for the MStar/SigmaStar Armv7 SoCs to boot secondary cpus.
>
> You need an 'enable-method' string defined too.

I had already applied the series by the time I saw this reply.

Daniel, please send patches on top of this series to address Rob's
comments.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
