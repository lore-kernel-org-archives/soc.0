Return-Path: <SRS0=ZyEH=G7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5E6C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Jan 2021 13:07:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 617F664DD8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Jan 2021 13:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 617F664DD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QtiEGsAYlJT1UbtH4UtyTavkDqf7KTN/lu9iGOjWCQk=; b=1PrOzrDX/FYnF1CI47kswi54z
	LEyZK6eTwGOrftC/aHN7OznME4xaco8Z9NFdV5cNvngnFziuJK92BQ8bVyYjlH7t/Vj6rzuJlBKj4
	yniEOLh75PTgVhDzjJVCiNkU/b51KeNMAsN3VKe+scBIC7VbSHFKCX3hybK9IvRf7QWmWSWBk56UW
	lRNsm8KsCihJuTbxWbnMYTBv+qs2KKPCqgQQZ3AzCLqHCSY0SfunU8cnmklqH93TLBxwH3/q5FjaN
	1jYmQWTtmWZkGDOHoOm7UYZ1RZUqkIgoWnXlyGY3WCDQr0jeF6PmOziQpHAzY8pG2CyeSkC4ZJPKz
	N5vf0x2Lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l56zr-0005Et-IL; Thu, 28 Jan 2021 13:06:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l56zp-0005EJ-7i
 for linux-arm-kernel@lists.infradead.org; Thu, 28 Jan 2021 13:06:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC10364DE0
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 28 Jan 2021 13:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611839158;
 bh=IhdZuuCocjMg/zVYiy4d4+I0r1v0cw4OX6ivH5EKyXA=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=octQ5zdsQyk3UGOApD+VUZfZZp8i80YvVB8E2fU7ZUIisIsbECvljjoj7Bs6vD8y1
 ErkO+yUtq8H71Jmwtt3JLau6Bc9NTVcq0hVTXvLNXwPj5CFJR6nEcxG0bD0k9PnMbw
 unQxRgiRWlUK5r3jeM53t5pdDWx9qPJHYGeFUIoP1f51NSs3OP1BKlfllqo03aXHv6
 pmnt1ucHjxl4PGiZwFtma1X58o+YXmAytOU3Rp4dzfsy6IPDmDmRKqVhqVvExedxds
 ykyPxBf5YGsXohEMK4KKb6w+O+2zvD5t94o/dmBRi5RUsFCSd4FL66aoJps3aa2Oz8
 lJcD9vh2e9VsQ==
Received: by mail-oi1-f169.google.com with SMTP id w124so5912002oia.6
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 28 Jan 2021 05:05:58 -0800 (PST)
X-Gm-Message-State: AOAM53320MnB8DM09jmXyLw7RLuHPZDvD0WXOpXA74hPE7IjP6ZxuxH6
 iOusqdScZeoDE7HPHYzuVa7o7B5WxGBHDTvA2rQ=
X-Google-Smtp-Source: ABdhPJxmNZXgrGqvLsYR4W8etb/JEOo9sB8YTyU3jVp2qNVHQlLWtjm0zYdYgcsQgLFLAk25Nxl7+mm80rUi2qUAFfg=
X-Received: by 2002:aca:e103:: with SMTP id y3mr6283020oig.11.1611839158018;
 Thu, 28 Jan 2021 05:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20210128075806.10318-1-avolmat@me.com>
In-Reply-To: <20210128075806.10318-1-avolmat@me.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 28 Jan 2021 14:05:41 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1RmN+MQoZSVA+ekMORLZdmTHtoEWtcPUzJLVujLCThXQ@mail.gmail.com>
Message-ID: <CAK8P3a1RmN+MQoZSVA+ekMORLZdmTHtoEWtcPUzJLVujLCThXQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: sti: add the spinor controller node within
 stih407-family
To: Alain Volmat <avolmat@me.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_080601_402317_496FD6DF 
X-CRM114-Status: GOOD (  13.35  )
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
 Patrice Chotard <patrice.chotard@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210128130541.ry8uiW_pCpTWiSbtmoneb6i4phjZELQZ5oLzCVQCgVM@z>

On Thu, Jan 28, 2021 at 8:58 AM Alain Volmat <avolmat@me.com> wrote:
>
> add the spinor controller node within stih407-family.
>
> Signed-off-by: Alain Volmat <avolmat@me.com>

dts changes look ok to me, but please resend considering:

- Add a proper changelog text, rather than repeating the subject in the
  body. I'm sure you can find something useful to say about this change:
  Why do you need this controller? Why was this not originally part
  of the .dtsi file?

- Address your patches to the correct recipients. I see you have eight
  addresses on 'To:' and only yourself on 'Cc'. Try to find out who would
  be the person to pick up the patches and send it only to them, with
  others in Cc. soc@kernel.org should not be in either list here, because
  that just means we get it in patchwork for the soc tree, but these should
  be picked up by the platform maintainer and forward to us from there.

         Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
