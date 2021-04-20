Return-Path: <SRS0=0nsL=JR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEBFC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Apr 2021 07:13:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CE8860FF1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Apr 2021 07:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CE8860FF1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=if9Uj6Pxs4T+ewNL1qarHACJsbXgfOwkmycjWuqY1oQ=; b=PfyyQnUuRN+g6l0b2d32uEgOG
	/onh7YQvZeQ6x8oHh+Oq/NB8OsneGXKG9nnV+INHNMo0FG4noILddszMB9lTOCUhAUDOPpXxf0Hcr
	tGzt6Qhy0t/mHOl/PEhBU4AFmmZ3WdRne3Vt6GK/fhF0zftBEYjjoZwSH6iJW3XWNS9+zF/27bHGa
	ekelCKzm+1FQZ9T1mXti7OPVdAPM9vtObifx8xjMooHaUNVbPVIhx5k8q9QS177zEbsEE5Z06ugDl
	Ul7N/GZR+GifwpmSEBQCB6xfUkZvMCF8uiz9d12Jev9Tbr26Ltv6b3oJTw+Oq3f17q6R+wTaTv+9g
	mguOabHLA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYkXb-00BQ74-SQ; Tue, 20 Apr 2021 07:11:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYkXZ-00BQ6X-2o
 for linux-arm-kernel@desiato.infradead.org; Tue, 20 Apr 2021 07:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DyGio9SalvX0/PlzfEkjduQC/y5WfEdpA8EplVfOAKY=; b=Ti3vsvnADWK+VDRW3NZXf9lyPe
 qhP+3z4oLs1bntmw22Jdr6l09cYngXlpcEOIRCwjIsHkCG9EppM0IuSEqUxMOzs+DGSNKAP5nntWv
 fmepEtM76MjBEKvJ2Ewj8n3bHnRdaMzikpXUkxm4/xkIGwMNpMejUfmkvDVxv/0qz1pCRtWuN/8g0
 f0KtgToOX8g4NQD2o7h0VWXpJsh2NtNs+DKn0c+6uq+BMXjx66Z8hj81EW/zLPYP+jiSornye0BGe
 QWlXa0P2aTive1zQpK/DyNzSdx9CR7oDLujjgflzGk2wwhIvKgYJZ483wssR6xuhETz/ZdnlUdlNy
 SbYk4ZXg==;
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYkXV-00BryL-7J
 for linux-arm-kernel@lists.infradead.org; Tue, 20 Apr 2021 07:11:19 +0000
Received: by mail-qt1-x82e.google.com with SMTP id z25so5290097qtn.8
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 20 Apr 2021 00:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DyGio9SalvX0/PlzfEkjduQC/y5WfEdpA8EplVfOAKY=;
 b=Gx++tH4AZWupH+et5Effwkd0iMutrH8tdoiYP7yEr25VGnFXkssJlvBalJCttRrMp4
 gNScOAIXzH2AwqjtaYOdCbemU5IHr4byYrk0cifVfsT3BDuoGAjTAOYc9xIOMxwR6Nom
 UhBes4t0y4otC5W3lLl6pVmAoeEA4pE8yygXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DyGio9SalvX0/PlzfEkjduQC/y5WfEdpA8EplVfOAKY=;
 b=PZ0QhnV//GwQ1ziDwTehxPSZ4fuzojRZ5C1TBJESJ3VxxXUxX8fKA4TrFvlu1Kivcr
 e8sYik9yKXFUBd4ZEiWwnsk1KgEjV5lYj2nwYJhrXcCIT9WssQsniEfK+gilCuf2r2gK
 RJdPdmz/iZjXD/Y3Yv0WHDt/GCj+G6po8H6TAESoMNTGPgzjJAXaK/n+PhNofOXSKYMs
 lNCOXEPJySE4pBH8QZlDInr0bu/t7V/DhsrZm2Xv1wiP4FAfDGXJVnmllgpFgNc+r33a
 g0NfFNZuSv4JYc3A35kGdWKSEVdmX1QndsfT7gBSbL4+KnDezh9RcRz9+dti9IGCfA9i
 sYFg==
X-Gm-Message-State: AOAM532XLO94EBKJBpHFpT7h5GtoXMvp8ebc188xKNSyiegRAue0KkEA
 1nUKmYuhV+RNxkF4rZBj8zehcQiQ7kfYrxK59hw=
X-Google-Smtp-Source: ABdhPJzRM0jLdBC1S6f8WwRWuDOdWL0MF6ILvix9Rcgs8unRf15jqAmHD7u9NAj5MuihLO9nz3BlyRgykR9CJm+2GqY=
X-Received: by 2002:ac8:5f87:: with SMTP id j7mr15120825qta.135.1618902674177; 
 Tue, 20 Apr 2021 00:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8Xeet50bqWAY0jG_GRkgvKvFn94XtGDaq1gaVYVkyV_JUQ@mail.gmail.com>
 <CAK8P3a1rG6qKjVvr86G=6cgkhReQUbsvQAkdxg7A2HsJ7n499A@mail.gmail.com>
In-Reply-To: <CAK8P3a1rG6qKjVvr86G=6cgkhReQUbsvQAkdxg7A2HsJ7n499A@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 20 Apr 2021 07:11:01 +0000
Message-ID: <CACPK8XfkSQpMz9J+8xN7DP9Wabv=+DAgmX6NGL9742Ss3HsehA@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: bmc: devicetree changes for 5.13, v2
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Jeffery <andrew@aj.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_001117_339478_E92A4EE4 
X-CRM114-Status: GOOD (  22.29  )
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
Message-ID: <20210420071101.8jGqb96LXIR8kaYnW88MepwLscPPYW25iEA1onSlCL0@z>

On Mon, 19 Apr 2021 at 14:44, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Apr 16, 2021 at 5:27 AM Joel Stanley <joel@jms.id.au> wrote:
> >
> > Hello Soc maintainers,
> >
> > Here are some fixes for the changes that have already been merged for v5.13.
> >
> > I also merged some changes that came in later. If you would prefer to
> > not take them then I can send a pull with just the fixes.
> >
> > The following changes since commit f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:
> >
> > for you to fetch changes up to f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:
>
> Hi Joel,
>
> something about this pull request doesn't add up, and 'b4' refuses
> to pull it since the 'since commit f0145db2' and 'up to f0145db2'
> references refer to the same commit.
>
> I assume this is just a copy-paste error on your end, but it would
> be nice if you could double-check and resend the pull request
> based on the ee33e2fb3d70 commit that I merged.

Nice catch. It looks I've generated pull requests incorrectly from
v5.5 onwards, and this is the first time we've noticed. My bash
history shows I started generating them like this:

 git request-pull tag url tag

v5.4 was the first time I'd sent a second PR for the same branch, so
when it came to generating the next one ctrl+R'd myself into the wrong
syntax and continued doing so ever since.

I'll try sending this one again now.

Cheers,

Joel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
