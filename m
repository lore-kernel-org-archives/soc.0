Return-Path: <SRS0=rNyZ=FO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A74C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 10:44:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFE4323D69
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 10:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFE4323D69
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4SvqWr8IlRQVGfPlA/uRtzNQjr7vveaLuD1JEN0kxo4=; b=mrkpGz0ojsDWp0c0vJbktC6pW
	DPFtoF2+4qiuDrtOEM0Z+tZ3IcywuXIun/Ao/u3gJqA3khKfRjhq5agHO4GdoZW0V8bye945w8gqs
	vH+nfUhiE3z/R6Mj0r5mn8egDoZxwQs46zHk7R0uKbntZe9CXVeOCTe9wFUlM2/ULFnO2cO0nMQ2P
	NiwbCoYJymvkbhXpeu3JNW7zardvhU4wbiUHlmWdu+JGPMfL6Dttm8taeuKnSCC8rMCpmQgVHh0Jb
	iQLyflcKc+QRAsQdb6Pad6YITkPWhH3LVTZa0l1BfjWu94poQWwA+GAPAoRuXKyOQLAarGIFcedAi
	gLX9JM58g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knJQ4-00020d-TR; Thu, 10 Dec 2020 10:43:32 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knJQ2-0001zn-Jl
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Dec 2020 10:43:31 +0000
Received: by mail-qt1-x841.google.com with SMTP id z20so3270506qtq.3
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Dec 2020 02:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HCXHdtmiujJrojUr10RP4Pb9dzIfVOToeT49LuGH/ks=;
 b=UGZc44LK50KqhqXQsFjm39B+rL98RRFWKa2cAbYIxUjv+cwLVW+6/kPmHLuJqecyGT
 Km5ihpsn9RqSobMcFcxoeYnWXsp+TZdsak67o5aEg5UJloaadciAVB1Az6Km88QiBU6o
 g1D0+qcgHgQL3qXSViLTBj5jHFPcIaVQDiyTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HCXHdtmiujJrojUr10RP4Pb9dzIfVOToeT49LuGH/ks=;
 b=GTaxtDG5kpTSPmU4ldvxuO/G0QazMll1Nmf7kwIf3fljK0yRu7m+9Iia4aKjIWBDaH
 yCt5ei91yIO5IzjVhzq50p/5baElayNlpFeVGQ9gie7oxH33UKWiUQWq86uNKseOBdr6
 Mhj3NNEzifs573PD4P/ZqIBCeinVxLKZsa77S1/FMTWVGFi+Qor7pH6L67yZ/DwnMDs6
 MSQu2vlIeMfNBF+iNxhIFWYK1Morecjdf0w0LQ2ZO2yHJcHC9NcOTLz217Cfa4CXBOL5
 g2Prv7dgpl8SA97vQuLUhg+yA0MKZ6h9oy3isb0d67jOa8SAizp6ld/k+PbBs+vLMseQ
 cuiA==
X-Gm-Message-State: AOAM531FtELQcz2Ydav3Wql9rb8DsYnUKAUAxpmNK9jA+2Mkx98ava5y
 I8S5Dsnxg7z7eIPfdbwppTPm1S+53/v9iyAn9pVFnQ==
X-Google-Smtp-Source: ABdhPJy3bPoQAsDQ5caqqcvDV2zL3T+aJ9ttI6e7E0xNhqz+94xh6Lw9p9EWpi/WKJqy3Oa8sA1obBIg2dhDfLw+LY0=
X-Received: by 2002:ac8:590f:: with SMTP id 15mr8286163qty.249.1607597009028; 
 Thu, 10 Dec 2020 02:43:29 -0800 (PST)
MIME-Version: 1.0
References: <20201201134330.3037007-1-daniel@0x0f.com>
 <20201201134330.3037007-2-daniel@0x0f.com>
 <20201209163536.GB566058@robh.at.kernel.org>
 <CAK8P3a0D+XQREm7Gw5-7-byiz7eufYGT_r-XC3H6_whdOB0a1w@mail.gmail.com>
In-Reply-To: <CAK8P3a0D+XQREm7Gw5-7-byiz7eufYGT_r-XC3H6_whdOB0a1w@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 10 Dec 2020 19:43:18 +0900
Message-ID: <CAFr9PXmqS-CX2zrrKVy4FAF7X6J-CrDBe-NMBNXjf7S5oMo5dw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: mstar: Add binding details for
 mstar, smpctrl
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_054330_686139_98EE649F 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 DTML <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
 Willy Tarreau <w@1wt.eu>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201210104318.dl62pgslGNz195fkG0N6lTBAegcmljCLy4A78U1Gavg@z>

Hi Arnd,

On Thu, 10 Dec 2020 at 02:45, Arnd Bergmann <arnd@kernel.org> wrote:
> Daniel, please send patches on top of this series to address Rob's
> comments.

Will do. On the enabled method one I had a question for Rob so I'll
wait for a reply to that and then send the fixes.
Sorry about the trouble caused.

Thanks,

Daniel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
