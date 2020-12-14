Return-Path: <SRS0=HHLn=FS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73DC8C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Dec 2020 09:29:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08AFF207A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Dec 2020 09:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08AFF207A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KPeYtePwzA+WMFUnssWwyfN3I4Bog+ELtXpGdgX8f6I=; b=mBq0p6m0CBL5BC1oPDnFC8wiL
	Fxg8G7GvUl3hzhfAONiBt2kdpj0zXevH0XUsui1dDE0MFLsV7n3b/USATFMBHZeeyFTVbmUUe4/oJ
	h9nqtVTOOqk4vWstXTu4kuA8KQDkx6dkWxmDNkgkuvBIcygJtSSMfZoDWdl0M4ha1eiLOY1kiOMVI
	P3lFy+PhNG70TEyedxUsoxWer6itLDTAUAmet5/nhhTAPJhjx+B72uUcVX4Q/7LLmAPCZx8nLqYQh
	CWko6VrfF8LW0HoIU9S9lM8+OZ3qNQkwpSpiMF89iNTErcm/jYb2x0qBocZer7QuiU9qiHeM5SjSY
	PYP3P5jXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kok99-0007WI-Li; Mon, 14 Dec 2020 09:27:59 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kok8r-0007PK-Ds
 for linux-arm-kernel@lists.infradead.org; Mon, 14 Dec 2020 09:27:53 +0000
Received: by mail-lf1-x141.google.com with SMTP id a9so28402584lfh.2
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 14 Dec 2020 01:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mlnOgRlYfdWWAtF0jT9VPpITSWK8EzRly1RHNCoFmLA=;
 b=xr6HjhuGFyztbp4aNTyix9tdk+oG9PipBRVB5d1A9QYCuxTk5o8ERogp6kz9yPpsi8
 YbC8XV+qRfA0o7FFGZgtsBUWYBuTQn6U0MWTZWNKK9U211wBbXgLzPIaNPVgS3DlziX1
 7hYtnbfOlpkQmQbKfJXAZGTixMaMAD1htXm7z/4HEmErgO0dTe0Qro86Vmzr/DF+uE+e
 DNUCMqMQxNik8oltpgib0H1gb3pwpP2vxc5Nu4O+6cPj5zcREApt++HW4JDG7Nr/0blT
 MwGCQyUw2E6TtSJ1IoeRuwEkmobduSOksXdPhzaykVgeWO8ez3Xf5TPDYo5U9u/Ah74l
 U7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mlnOgRlYfdWWAtF0jT9VPpITSWK8EzRly1RHNCoFmLA=;
 b=aHTGIIHcs6eqSjBFwGRgNNc3OPmkDL6U57u3Mbwur8QF5+nksKg9GYXPrh2u51bMgQ
 +cFh46RD7pAqQGCVUvW/j7gRzY1B7ejAvIpn5VEsUnqYa3rq643XhUO2QO3uzPU1dwTL
 w7SVCevl+4pzbHrcAayS+RuSJG/5tEB/aCZ9RxCYflOeo6StehlVEuEb+cMtdeSupIVI
 O66CYhC7IDE73mbvh6MqxrJlOJMHzFgYFnk+jYW61iO1mcHXSBOSw7/ITH8jsp220OY4
 YpXuZt5aQ2Ft/fSFPKPgRh5K0Lr3/RjoxMO3YP0euwSib7U25bJ91TmYnVLWqqFMciVH
 Ytrw==
X-Gm-Message-State: AOAM530i/awNwbn0aHhGNuGzVpsZkF0iuKGqj3OZ0iSQVV/PLXRJjw6V
 NpJFjm65V+lPSwiikLSCu/lZHfk7V/9Cdfzn6/n01Q==
X-Google-Smtp-Source: ABdhPJzGfF/vu7nSSKr0Z061mb6vkrp+fqfxWfVG1o+XueFjyYMpJ9Qse/CDkKG2bP6HvYJNDDf/q/VcH1TqwB7Wg4c=
X-Received: by 2002:a19:6557:: with SMTP id c23mr8730637lfj.157.1607938059529; 
 Mon, 14 Dec 2020 01:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20201213225517.3838501-1-linus.walleij@linaro.org>
 <cc06e06b-ff24-68a2-f5f3-c8533118a34d@redhat.com>
In-Reply-To: <cc06e06b-ff24-68a2-f5f3-c8533118a34d@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 14 Dec 2020 10:27:28 +0100
Message-ID: <CACRpkdZp+gnJAo02OJkiN_KUX3bOPc2vzQGWHLZF2hQHvuQQkw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: ux500: Reserve memory carveouts
To: David Hildenbrand <david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_042741_611760_64605084 
X-CRM114-Status: GOOD (  14.00  )
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
Cc: wi nk <wink@technolu.st>, Vlastimil Babka <vbabka@suse.cz>,
 Pavel Procopiuc <pavel.procopiuc@gmail.com>, stable <stable@vger.kernel.org>,
 SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201214092728.V3O4D4mqXv5SBG-rNo7W1hJI4ER5CSNfSoW1NTDXsbc@z>

On Mon, Dec 14, 2020 at 10:21 AM David Hildenbrand <david@redhat.com> wrote:

> > ARM SoC folks: please apply this directly for fixes.
>
> Can we come up with a Fixes: tag or has this been broken forever?
> (assuming modern boot loaders)

It's been broken forever :/

> > David: just FYI if you run into more of these type of
> > regressions. Actually the patch is unintentionally good
> > at smoking out other bugs :D
>
> Thanks for CCing - I'm adding some people that ran into similar issues,
> but not sure if the other bugreports are related (or have similar root
> causes).

Yeah we first were convinced there was something wrong with
the patch you made but I read it over and over again and there
is nothing wrong with it at all. It just alters the behaviour pattern of
memory management in some apparently drastic ways.

After a lot of silent crashes I finally got an external abort with
a reasonable backtrace showing the PTE pointing to this
modem memory and then we figured it out.

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
