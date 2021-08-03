Return-Path: <SRS0=WGdq=M2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C3CC432BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 11:55:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD4F460BD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 11:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD4F460BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1FCn1gufUwfe5DKB7Fnb4dqGp0ejTGFJX3B+VcDf2Y=; b=20radOL3xW8jPc
	WVI2zd+gNu2EC4gfV5iZa3nEVa3EiUVQacXhaPPqo3kg2R/cPs3zv4xqSJEC7CTey4glG8kWj2lmu
	ZuaCkTKSZO5SYt2zOmS/AafKun1d1rFQRIPg3auFfOx2JCvP+GwdotY9oacQzpYX3+LH7na19btNp
	7D7ryxecnEjF7enhoZAKaKS1AX2e6oF7jWjQ2icbIjp/p0CfSZmmiIrcuAPUnqvy1qWVo3IKzSl1R
	CRy73Z4dZBib2Z4/qWkKrYxYas/wyvDqKpBsn5wQ6YhtqN3pCO4nmsGFSTk3Jw5eyshpT3RIez8Gk
	FAsSg4tF6e1hS39N/YsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAsye-002Pc2-Tj; Tue, 03 Aug 2021 11:52:58 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAsn6-002Kw7-Ma
 for linux-arm-kernel@lists.infradead.org; Tue, 03 Aug 2021 11:41:02 +0000
Received: by mail-ej1-x630.google.com with SMTP id x11so34993560ejj.8
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 03 Aug 2021 04:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UTH1xriYdp7u5xYL3QfzWmKRaaFC9ziEV6g6dXWdnAA=;
 b=tgjPUlEFLS9R3pe1i23bVN9uFNo5sB8O4gOOXAhmPTwVrZrVq+R0HvfFC7tCxJMGS0
 wiQmMdBJ7Qjs8IxqQ+Kk/XPsRmKOP2ZL14CDSP5EJahGpBhZxGqN+9OziIl5Yg45A85I
 5KfD8GlzssfveCwgOsgys80okroPvFFEkPF6mb1t0cW3CkOjQ9G8cWdaCQuhdirdHJGI
 JlTGf8jCSLZDGkdgMDG7NLABtdeNCfzSvAPPQng1kCP8mzptXf9k8jKgq6wMbyO1zWgz
 V/9Sa9moikRXguzOELOnYVB9mR75hUpcA59WfzrXQ2WZaagQPmNKgDsy97rVMTJMgRri
 ku0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UTH1xriYdp7u5xYL3QfzWmKRaaFC9ziEV6g6dXWdnAA=;
 b=BwZuUiTqresO0+ypzL+xYw+C51V8Wwg8wooNz/Iby5q8Fitala86IPDpJoUVqHMaSI
 zB1od3Y5zDlT9qJSNkWEvQC9lW0VOIqGjnY+E1K3zSnO5pdDssLZh+Ke4KlfUejFghpo
 WX4+vBH0woPsWKVXQvFOa21gr+LAWtov/oXKDTNqAz4X4WfWBP0iaRm0+R1mWVdxfR6y
 K3KDBLn66W1L4UylFNzfEQ2Gsmm+NaPjuPRwoabykGkuyrBk5K13+tNQCvMkKQnPoYbB
 MmHxJdB0S9uAAe0w5hsOU+Fs8c0nWiUlWfyzoms2baMIo8eoqNUX+bz36ovRTMTMiDP5
 xphQ==
X-Gm-Message-State: AOAM531OWm7ZVyDZV91+knHnOMX+yFv/Cj3MM2Iv/4dXrNXLjO9hIJ/A
 XMsf4+IWnZB7U9Lvut9drEk4MIn9z8BGtiGoLb8=
X-Google-Smtp-Source: ABdhPJx+oRy7TDwar4JICPJWtGOTCfgTSmYrsw5qbLO26sc9JEqhl7vCfDGC77LJsFULHHYzz9kc6ojyUInie41FksE=
X-Received: by 2002:a17:906:4d12:: with SMTP id
 r18mr19569693eju.537.1627990859185; 
 Tue, 03 Aug 2021 04:40:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:3018:0:0:0:0 with HTTP; Tue, 3 Aug 2021 04:40:58
 -0700 (PDT)
In-Reply-To: <CAL4-wQqCL1S-GYu7VKJeTT37wh=rR=SMUuwgKiXnnn_Y=uydOA@mail.gmail.com>
References: <20210802141245.1146772-1-arnd@kernel.org>
 <CAL4-wQqCL1S-GYu7VKJeTT37wh=rR=SMUuwgKiXnnn_Y=uydOA@mail.gmail.com>
From: Martin Guy <martinwguy@gmail.com>
Date: Tue, 3 Aug 2021 13:40:58 +0200
Message-ID: <CAL4-wQpKLtSj0xfNUXXLhbtN1wC051jpRneAuLYOi1riZfiinw@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: remove MaverickCrunch support
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
 Hartley Sweeten <hsweeten@visionengravers.com>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@kernel.org, 
 Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Hubert Feurstein <hubert.feurstein@contec.at>,
 Lukasz Majewski <lukma@denx.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_044100_803067_0C472885 
X-CRM114-Status: GOOD (  17.90  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210803114058.1qDkIzvedtfq8PpzfWF8f97FCzxNrBdxCsv1b3Jgi9s@z>

SSBmb3J3YXJkIG9waW5pb24gZnJvbSBwZW9wbGUgY3VycmVudGx5IHByb2R1Y2luZyBhbmQgc3Vw
cG9ydGluZyBFUDkzWFggYm9hcmRzOgoKRnJvbTogVGVjaG5vbG9naWMgU3lzdGVtcyBTdXBwb3J0
IFRlYW0gPHN1cHBvcnRAZW1iZWRkZWRhcm0uY29tPgpUbzogbWFydGlud2d1eUBnbWFpbC5jb20K
Q2M6IGplcm9tZS5vdWZlbGxhQHNhdm9pcmZhaXJlbGludXguY29tCgo+IEkgZXhwZWN0IG91ciBj
dXN0b21lcnMgd291bGQgY2FyZSBpZiBzdXBwb3J0IHdhcyBkcm9wcGVkLgo+IFVuZm9ydHVuYXRl
bHkgSSBkb24ndCBrbm93IHRvIHdoYXQgZXh0ZW50LiAgSSdkIGxpa2UgdG8gYnJpbmcKPiBKZXJv
bWUgT3VmZWxsYSBvZiBTYXZvaXIgRmFpcmUgTGludXggaW50byB0aGUgY29udmVyc2F0aW9uIGhl
cmUsCj4gYXMgaGUgcnVucyB0aGUgc29mdHdhcmUgY29tcGFueSB3aG8gbW9zdCBvZiBvdXIgY3Vz
dG9tZXJzCj4gY29udHJhY3QgdGhyb3VnaCB3aGVuIHRoZXkgbmVlZCBhIG1vZGVybiBMaW51eCBr
ZXJuZWwgcnVubmluZwo+IG9uIG9uZSBvZiBvdXIgQ2lycnVzIExvZ2ljIEVQOTNYWCBzZXJpZXMg
c2luZ2xlIGJvYXJkIGNvbXB1dGVycy4KPiBJIGV4cGVjdCBoaXMgb3BpbmlvbiB3aWxsIGJlIG1v
cmUgdmFsdWFibGUgdGhhbiBtaW5lLgrigIs+Cj4gR29vZCBtb3JuaW5nIEplcm9tZSwKPgo+IEEg
bWVtYmVyIG9mIHRoZSBMaW51eCBLZXJuZWwgRGV2ZWxvcG1lbnQgY29tbXVuaXR5IHJlYWNoZWQg
b3V0Cj4gdG8gdXMgdGhpcyBtb3JuaW5nIGxldHRpbmcgdXMga25vdyB0aGUgY29tbXVuaXR5IGhh
cyBzdWdnZXN0ZWQKPiBkcm9wcGluZyBzdXBwb3J0IGZvciB0aGUgTWF2ZXJpY0NydW5jaCBGUFUg
b24gdGhlIEVQOTMwMiBwcm9jZXNzb3IuCj4gV291bGQgdGhpcyBpbXBhY3QgYW55IG9mIHRoZSBk
ZXZlbG9wbWVudCB5b3VyIHRlYW0gaGFzIGJlZW4gZG9pbmcKPiBmb3Igc29tZSBvZiBvdXIgbXV0
dWFsIGN1c3RvbWVycz8KCkZyb206IEplcm9tZSBPdWZlbGxhPGplcm9tZS5vdWZlbGxhQHNhdm9p
cmZhaXJlbGludXguY29tPgo+IEkgYW0gYXdhcmUgb2YgYSBmZXcgY29tcGFuaWVzIHdobyByZWx5
IG9uIHZhcmlhbnRzIG9mIHRoZSBUUy03MjUwCj4gcnVubmluZyBub3QtdG9vLW9sZCBMVFMgcmVs
ZWFzZXMgKDQuMTksIDUuNCkgdG8gY29wZSB3aXRoIHRoZWlyIHBhdGNoIHBvbGljaWVzLgo+Cj4g
V2l0aCBMaW51eCA1LjEwIGJlaW5nIHRoZSBuZXh0ICJTdXBlciBMVFMiLCB0aGlzIHByZXN1bWFi
bHkgYnJpbmdzIGl0cwo+IHN1cHBvcnQgbGlmZXNwYW4gdW50aWwgYWJvdXQgMjAzMCwgd2hpY2gg
KEkgYmVsaWV2ZSkgdGhleSB3b3VsZCBiZQo+IGNvbWZvcnRhYmxlIHdpdGggY29uc2lkZXJpbmcg
dGhlIGFnZSBvZiB0aGUgcGxhdGZvcm0uCj4KPiBKZXJvbWUgT3VmZWxsYQo+IFZpY2UtUHJlc2lk
ZW50LCBUZWNobm9sb2dpZXMKPiB3d3cuc2F2b2lyZmFpcmVsaW51eC5jb20KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFp
bGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
