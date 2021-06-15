Return-Path: <SRS0=uLNJ=LJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CA7C48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 19:44:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2805D6137D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 19:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2805D6137D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BWr8xdc1yRbu9ioNnb8FSH5BLi3mOth360A1KiE3Jm8=; b=LbobbABlX8qAUK
	204E0LKR3b6v7PElSnn2JqN0SO03vpfyazAXiJIEdFIBIsOVpw4Lnct9j0iaRRz/IxKv4F5CZnmqH
	X5OdayRwS/0j9sVwGJe3CBRqZYWFT/00GFJqzExqTe+1HIOI2+Yqxol8K8y2C/+YV5IiMlpXRDAUX
	U6WEdGSjBvGANnulliU3Twnssuksd+2EQBtSH+NNoTDj+5kGm8FnfHXO4+G1LWb+zttIjLdFRZeqQ
	/AAq7uHfCNzov1F6BTduDCRGNH/3EA7l8eg1AOAcVnToDuxI/WKYZkxkxB/8ycj371TKVGd6q3I65
	liy25D9NZJBbVIZyNrnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltExi-002XXC-AP; Tue, 15 Jun 2021 19:43:03 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltAtD-000vaM-QJ
 for linux-arm-kernel@lists.infradead.org; Tue, 15 Jun 2021 15:22:09 +0000
Received: by mail-lf1-x131.google.com with SMTP id bp38so27766417lfb.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 15 Jun 2021 08:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ICIAWSq5Krpfs9+8pM47fNoow5b/bl38CHr2u42K0m8=;
 b=cFISYhUsn1NZMoeCzk+Rv4fM4VBWfCuieQ5cecBFdAdXnbHTENQYf3VJZBakL8LyRJ
 5ULfF5l7pyuf5lXzgDdCfaqirk3OyKtumx1OZ/gCTO06882AA8L4mSWIJn366bAtllTT
 m01oGordVZKxny12pyu2P25BN7FLTGWugV0VEFatOwI9u40JT1rygCWhld1+9+5BH0ly
 GZgJm3WulG9vHPSkhgImFulhfLfW6tQ+tWPceZ35ISf9iyUUf182shikwMtMnq9D52Hv
 GoS7LdA+EqGfz6tzZLuF8a5J2KO9oFNHZv8XWAduzCH+oRZmpxOxFWH0lTErD1kyvBQY
 1Eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ICIAWSq5Krpfs9+8pM47fNoow5b/bl38CHr2u42K0m8=;
 b=J8i2xTZ6CnOL64JLCOhdsza8LmZhpNnb5h0EH4zRBrgRAB6LcsysNxaT9skIKcUc0/
 yPJMhMzHd2jnbo3fHnFOo6S0X+gqLP9BXMwlLCwx1Fy9KRDbJ+PK2tjVyyGVsiVauL7K
 ifUNm9YM4AcU0hOupUq2DCHWdoMvKW3xXTSsxvFMnEivTfw8ubbZAw7MwVmA39LDXVlV
 EBjgUpzjSaXfISVc0lPX7XT7Je8VvbSz+YDHbcAGrIEQ9YKcvSCzk6yAZVC4pkv1orqf
 0lVDX0/qw8+a4DfA86Qj16ucy9ab68b2wT43Cg7UtKrmTvJnBeEnhiL6ALQEsN9B1Byf
 7YJA==
X-Gm-Message-State: AOAM533h4Sax1riWto2EJbfbutnEh5hjrMbQ8A9uut+kXvEj9w5gjdM0
 fp8R9QATzR81IB5l0zeFr+lQrQ==
X-Google-Smtp-Source: ABdhPJwjtECBUQTA6PaG5F64vPTLi70W0DvSK/6b8AUgp8vwhvSY9UKRO+VUiPRo+/M7UfvRy/nLDQ==
X-Received: by 2002:ac2:4f89:: with SMTP id z9mr16439525lfs.46.1623770522972; 
 Tue, 15 Jun 2021 08:22:02 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id a23sm809807lfr.22.2021.06.15.08.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:22:01 -0700 (PDT)
Date: Tue, 15 Jun 2021 08:21:49 -0700
From: Olof Johansson <olof@lixom.net>
To: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>
Subject: Re: [GIT PULL] firmware: arm_ffa: Initial support for v5.14
Message-ID: <20210615152149.GB11724@lx2k>
References: <20210601095838.GA838783@bogus>
 <20210614170856.rs7jrke3gvpmu4km@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210614170856.rs7jrke3gvpmu4km@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_082208_019226_B0E5F61C 
X-CRM114-Status: GOOD (  27.94  )
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
Message-ID: <20210615152149.Uz0x60gU7hzV7DX3m1DkqScFebFE0ABZu3BY0yzVGaI@z>

Hi,

On Mon, Jun 14, 2021 at 06:08:56PM +0100, Sudeep Holla wrote:
> Hi Olof,
> 
> On Tue, Jun 01, 2021 at 10:58:38AM +0100, Sudeep Holla wrote:
> > Hi ARM SoC Team,
> > 
> > Please pull !
> > 
> > This is a new driver pull request. One of the arm64 patch is being
> > pulled from a stable arm64 branch for-next/ffa as the other patches
> > are dependent of the same.
> > 
> > Background
> > ----------
> > This has been on the list for almost a year now with changing requirements.
> > Initially Arm KVM wanted to use this via userspace interface in VMM to
> > communicate with VMs. But it was later dropped in favour of arch-agnostic
> > interface[1].
> > 
> > Also there was some discussion on the dt-bindings which was dropped
> > completely. Though we need to workaround the lack of full discoveribility
> > in v1.0 spec, it is now being fixed for the next version of the spec.
> > 
> 
> I see that you have pulled quite a lot of drivers and other SoC code
> including my scmi and juno ones that were sent more recently than this
> one. Just thought of checking if this is still in queue ? Sorry for the
> nag but this has been on a list almost a year. We missed v5.13 due to
> DT binding controveries(for good reasons) and we really don't want to
> miss v5.14

I held off because I wanted to spend a few cycles on looking into it before
blindly merging it.

Are there any implemented users of this (on either side) today? We normally
don't merge a framework in the kernel without having at least one user of it
also available.


-Olof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
