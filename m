Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F6CC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 23:33:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48AE423B99
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 23:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48AE423B99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+ecmr6UFtVQJNNtgSH5qwk0s99dc2rXlAN2nOMAZAW4=; b=nTJn4z4wY3vUsaxxxN0UkKboP
	XEDcval3TbXB3NVlnKogargZjAqVQ04TLKkQW/sQDYm0XZxcViZZG6aG+PB3cSnArVeVpX3PYnQ7U
	gSWEThG3vu/pXW5LcF7JagRCeT7EI5w2TfTdcMxtd1BjO5OVdAJsHSk/f/k0cXUAXpkMVoHqsJn1n
	88l23q5Knf2YTswfBysSNA2RElRP6Kiq9e9dmBwQCtRKGPqGuklQiy/91PWWgczZEMYKSVLdZBnog
	9RCLtB24woMtMcqRS5Haf+k3Cow2zuzvswadI6IgBgTRWxQZNgzHSNsFj3hpN/P/FqcguwZErmSWK
	Jca87QhaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn8K1-0005ih-1X; Wed, 09 Dec 2020 22:52:33 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn8Jx-0005iN-HK
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 22:52:30 +0000
Received: by mail-lj1-x242.google.com with SMTP id q8so4402025ljc.12
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 09 Dec 2020 14:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LoZxe45tfXr4/FDvc4CABuzQn5OyKXJcb52tHgb8yL0=;
 b=byRPSi/mKwHLY2fdQcTNrRj6YvGbp+G5DCe532S8h9jvM5zGWe6bGFkBgJLn8a8efh
 wNR1E46A1xONxrnSS6D5a1rIQTyJswuGS7bQtK2cELi3Z4KHz3Uv0BX+UljIjb4CQ0pD
 OkiO0DcVdNYHZ9vc4BJEeAjyOABQDyJ8appoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LoZxe45tfXr4/FDvc4CABuzQn5OyKXJcb52tHgb8yL0=;
 b=GmU2LppSaM52NceOWb5XdJg4H5pzYWvuFYm8tuTXeLfFxFmDOcvejfQaTr6gjyjxCw
 /9VXnigHUJZ8VzWG6FP4hS1kd6crZtDjoIlQk0IRxo29qA/pcmMh1TZMi7JSjZ7Fkpij
 vLWebmfopj6TvZjRUvP8Ko0mZ4n8ZdJ7/mutTAwlsHZkwJm2gRmxcsy4ko1UGz4n1MJs
 QlKeKvKw0R5dS2SxLYK9/pGdZLICryv/CZjdpqTH+bVIW1EalJpPkY5LpxxnhhMY8A+Q
 Gs6/XYz+kE8YbiKbjX7DX2bhGo3dynQGIcC1EzT1d/OPdytXquqRjqCqdUQl1JtapB+3
 /2aQ==
X-Gm-Message-State: AOAM530O/uEMtX2cM95LkuFQt3prQptQjdNh6VND+qannjsT8V6CqiG6
 c76TBKIHQyXsP/52kjj/eoGSqYOm2DG55g==
X-Google-Smtp-Source: ABdhPJxXu6BBnj1nVmOWn489/HylCPZiezasEJx4ZKTsF50hG6mSNpG3ICXz0tBQsKqzMCLkcnvEZw==
X-Received: by 2002:a2e:9a58:: with SMTP id k24mr493233ljj.259.1607554346891; 
 Wed, 09 Dec 2020 14:52:26 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47])
 by smtp.gmail.com with ESMTPSA id h21sm387211ljb.122.2020.12.09.14.52.25
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 14:52:25 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id y19so5368936lfa.13
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 09 Dec 2020 14:52:25 -0800 (PST)
X-Received: by 2002:ac2:4987:: with SMTP id f7mr1565679lfl.41.1607554345273;
 Wed, 09 Dec 2020 14:52:25 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a04h2KA6s-m_O2MJ098frTSmxvAg-ngrdP4d9=9YLXmyw@mail.gmail.com>
 <CAK8P3a2piZwSjDudPu8mOEBnRHFAXRBMcRZsqS8b6YD3Kjwsow@mail.gmail.com>
In-Reply-To: <CAK8P3a2piZwSjDudPu8mOEBnRHFAXRBMcRZsqS8b6YD3Kjwsow@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Dec 2020 14:52:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgkby5F6EpGxN3kXaxf8YPkXKb+873hSE7Ly+zEJZrXrg@mail.gmail.com>
Message-ID: <CAHk-=wgkby5F6EpGxN3kXaxf8YPkXKb+873hSE7Ly+zEJZrXrg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 4
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_175229_969961_448CD6A1 
X-CRM114-Status: GOOD (  10.66  )
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, SoC Team <soc@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209225209.feNB8kwqd7stJKedzHwkftLBSdMNs-9vjNcwPRptXX0@z>

On Wed, Dec 9, 2020 at 2:07 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> Stephen Rothwell just pointed out that one of the fixes I added today
> was missing a Signed-off-by. I corrected that and uploaded a new tag

Gaah. I had already pulled, but since I hadn't pushed out, I undid it
and re-pulled..

          Linus

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
