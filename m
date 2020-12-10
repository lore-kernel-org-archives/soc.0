Return-Path: <SRS0=rNyZ=FO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DF3C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 20:23:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9040623C18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 20:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9040623C18
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=20MkZY9ki510i7rI0C36BjH6KrIMSUjjg1162RgDt8A=; b=iI9wsdzxcmP2ZimaGIs1V3Y+F
	QGuaiRJCxOoyTlB9sTt0DMHRG/FySq1R08B6wDHdGGGaLaYQ/s9oMOrb/5HF6g98RvmHCTA2DnqCV
	8USOoLrpIC6vGocIPC0PjCPf/tNnsPIBzPRmBIvAtbDTeYk9juOnHNY79o7XMbFzjiWdI4LrvT+9n
	kLyF+fOhAxguCeaHV+h6g9FNnqJmg+yaruwgsnDRkdvM0BuJkipUVeoaVKuXsU/JI0Uw66CxHdNWC
	jc5SujHLUGLbK0wBb43S5caXEuniI7TB21wYEOYi1JzxWg4dU7iZcJYCeJaOB8OLK/TNOBDCXzKBC
	CctXgBNNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knSSH-0003vK-TN; Thu, 10 Dec 2020 20:22:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knSSE-0003uu-Vb
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Dec 2020 20:22:23 +0000
X-Gm-Message-State: AOAM530ojNhnizxv7V31EmDCbLKwiEd6ZqUF6kJQkjo9wAAXBc9KQDze
 JgF1km26aQ8WSFj+4+zHfXlZseN6ifWV+E9/ooY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607631742;
 bh=8TQ1bUVPk8mSwF7lFyW8OxP9kuYRMvtYBaxVPJ14Hao=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=LmemddH0eISy+dJVujpx3ALD9+yen2fzEtp8zOQINkjxq+B5hDbe4HS3M8A7nOp8v
 WBovG/B1gN8KIAXyHZW+j7a76VRXYD4Psc7nQPokaiW19j+VgvaGq71r8T0k9Q9ioa
 xaPY5ajr6lqKIgu6c5QhWM0o5KsfO7bqdIJEEm1E2LhHsraj0GrkLkwUyvQb8mD3L+
 wBgA0zg6VM5AZ0VXljFydTLw18zv/6Nc5ie/4qwaEO6tEbf388Tt/VqrBNqLzwvjOh
 izbhUwxR95Mrf/AdsfVQVhRsK3/idvvNdqDophEo25e+9jSPIvYA7m2RWuGQjoDMeI
 yrxQ61zXZchhA==
X-Google-Smtp-Source: ABdhPJxpr7G1kGMUrmTW1nCq9okIroksVn1Y8gcDkWIIb7j4ouv4Upl/Vr7Ae3KCHLUqI0iz/3uXUIgx/px9a/O1BPc=
X-Received: by 2002:aca:44d:: with SMTP id 74mr6798421oie.4.1607631741379;
 Thu, 10 Dec 2020 12:22:21 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com>
 <20201129110803.2461700-4-daniel@0x0f.com>
 <CAK8P3a2DGLfkOEm3JeXN-jWvDfxberaXXqOtu4wKdtYzqDWiNQ@mail.gmail.com>
 <CAFr9PX=fhKiZF80iKaGeBWOONm3VpwtzgbB+yBHk8MHdTotaHg@mail.gmail.com>
 <CAK8P3a0zCa0Dq8uUDoSbu64sGLeNWrSk=6i4pKzgwerRseXfnA@mail.gmail.com>
 <CAFr9PXnGF1PV8vnCpdCuSB-z9ns5BPDjhJvPg7b+rUC0GrjhqQ@mail.gmail.com>
In-Reply-To: <CAFr9PXnGF1PV8vnCpdCuSB-z9ns5BPDjhJvPg7b+rUC0GrjhqQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 10 Dec 2020 21:22:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0HzxVcuY-6hTf5e9yeM_NF6AafG_Pv5YrOvrMVuUdrEw@mail.gmail.com>
Message-ID: <CAK8P3a0HzxVcuY-6hTf5e9yeM_NF6AafG_Pv5YrOvrMVuUdrEw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] gpio: msc313: MStar MSC313 GPIO driver
To: Daniel Palmer <daniel@0x0f.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_152223_098635_DBBD773E 
X-CRM114-Status: GOOD (  17.97  )
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
Cc: DTML <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Willy Tarreau <w@1wt.eu>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201210202205.paWqifNvZus4MMFd152aUBbfzxtx5YlslJUdOnp_DAk@z>

On Thu, Dec 10, 2020 at 4:49 PM Daniel Palmer <daniel@0x0f.com> wrote:
> On Thu, 10 Dec 2020 at 23:28, Arnd Bergmann <arnd@kernel.org> wrote:
> > > > It would be helpful here to replace all the readb_relaxed/writeb_relaxed()
> > > > with normal readb()/writeb(). Don't use _relaxed() unless there is a strong
> > > > reason why you have to do it, and if you do, explain it in a comment what
> > > > the reason is.
> > >
> > > The reason is that readb()/writeb() will invoke the heavy memory
> > > barrier even though it's not needed for peripheral registers.
> > > I guess it doesn't actually make all that much difference in reality.
> >
> > Ah, I forgot you had that heavy barrier. It depends a bit on what you
> > use the GPIOs for then. For most uses I think the overhead does not
> > matter, but if there is any bit-banged I/O it might make a difference.
>
> Bit-banged buses are likely to happen I think as there is a lot of
> gpio compared to hardware peripherals.
> Anyhow, I'll add a comment for the readb_relaxed()/writeb_relaxed() usage.

In that case, maybe add an abstraction for register access in an inline
function that takes a pointer to your device-private data and the register
offset, so you have a good place to describe it once.

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
