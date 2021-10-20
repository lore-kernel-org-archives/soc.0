Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F436C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 16:31:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC0DF61354
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 16:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC0DF61354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kzz4EYxPDpEYiIHrtLNNvU77NvR38K1TFj7YLoiumJM=; b=ypKqm49bOalXor
	D3VfLWkCkr36ESxX2m1HgVkDKN/7ztLNIYB809Kt3LinPcJ/S54/WgTktqSDxD6gyMSgYNKDh62+a
	ka3Z8RWIycbBIW5OA2qFD7J8BQKITBeLHpXdO/UfVslwxUjdpSOLHUTbDNg3i+CjL2kR7zib5AsCD
	jKfPW7I8fvBSUvyidkiVf1VcpJ6sB8hkfmuue3pqpLUDtHWLp9eO0QlfbWhzrqxQ53rtje51lI3Ps
	nVN6G/nvPBxrzq5ReevMtyRaGP/k5MRiVXZuBBcuL4VGow3JE++D7MmJdzMY5MQSOoDQUm4F0V80O
	4mLHBkTtbx5bnlb42oZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdETq-005F7P-Ra; Wed, 20 Oct 2021 16:30:19 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdETm-005F6I-Lh
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 16:30:16 +0000
Received: by mail-ua1-x92b.google.com with SMTP id i22so7679024ual.10
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 20 Oct 2021 09:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5caiCMTP2cHNzS4IuisPKtBRNIaBTwtP2qKMTIl/yAE=;
 b=CDHhkFvkKFsn5S8MYqdHwzYlGwxiaE3OmWB3tLSf3ZMH4N4y3S3+XCgeodxSbJQ+62
 Xfc+CO/d5B/KFnW93ZZEXuNTYp9PW6VS7M4fneoVpYjdxMG0du7vfZcPox7OAMNbQ2gB
 8VX9pnaeHVN+KPRWRuePg++ukZVS82HY7SMMbAa690rXL4VrdRrdSgxBCvC7M4jPE8E1
 wibJIqvYkGcd/3ge4TCF2qA+sUNExDUlwzPe99NglFdZBPstMQolcmYzp38oDNEsCTIa
 9ynSKTZ3rW1p3nz6VRrWibYBBFKyWZikxwC9zSq8qURFhYKqlIqbOdJwKs3YEia8IFAA
 taTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5caiCMTP2cHNzS4IuisPKtBRNIaBTwtP2qKMTIl/yAE=;
 b=El5yWpSCswups/lvgrn5CLTHUAqHAwt8yIqiIBLZXmwCpiKSfLHgt1ok/VRUAjPVpF
 7q+SAe7v0fbP7+vZamYa0DTtfHmiW5Gcp1gVgv1RahgDXlwIxXY5z1tuDkeztKpIhdlm
 uKw7bTRNHfATEho6754oYFCzkhYqbUo6m5GaVxpUeiBqnU4w8EZ6zB72B9V+gA8pVTxV
 ecW5gfxoPeXRHCWoeeKc33fPrh8hMaPAcM6pIRORPfhKAdgo8+8IR9opdZxtjgJZGS+D
 9jP4zANFB6uDATRRvOYvdJfqCCGt8bMYSs2SBxxC14rLmNOH+qc4xyecyj30qhaAaWw2
 LKfA==
X-Gm-Message-State: AOAM531sMyEdRmBJDYCbvfHrRDQbHzOEDVRYg5OPTPou7kon1lT58zlc
 vX7LzmDB9PLPIOqLeeiQeHCDcZhpntr/JqT3E4g=
X-Google-Smtp-Source: ABdhPJy13kMUma4/p0kTk20RSSMl2/hidWbgRe17hUa1/tUPefdY4Ij5jef6A43XRsbYgwgCd9hunLVT4hKjvEslYc8=
X-Received: by 2002:ab0:7a53:: with SMTP id a19mr218376uat.126.1634747408383; 
 Wed, 20 Oct 2021 09:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211018095848.19101-1-romain.perier@gmail.com>
 <CAK8P3a3vOyqFOf0iFZ9UaUdH-kF13ckYA4Qh56zmSzSvr5dGLg@mail.gmail.com>
In-Reply-To: <CAK8P3a3vOyqFOf0iFZ9UaUdH-kF13ckYA4Qh56zmSzSvr5dGLg@mail.gmail.com>
From: Romain Perier <romain.perier@gmail.com>
Date: Wed, 20 Oct 2021 18:29:56 +0200
Message-ID: <CABgxDoL1c4kVEzj7sAn-8FTx6kB90yY0we9Zzfpi+r3+6mYQng@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: dts: mstar: updates for v5.16
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Daniel Palmer <daniel@0x0f.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_093014_734350_2A53A9A0 
X-CRM114-Status: GOOD (  13.77  )
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
Message-ID: <20211020162956.Roc0X-zveks7pNQD9rnoxL8MGudHotfOjCimQ-N22oU@z>

QXJmLCBteSBiYWQgXl4KCk9rIHRoZW4sClJvbWFpbgoKTGUgbWVyLiAyMCBvY3QuIDIwMjEgw6Ag
MTU6MzEsIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IGEgw6ljcml0IDoKPgo+IE9uIE1v
biwgT2N0IDE4LCAyMDIxIGF0IDExOjU4IEFNIFJvbWFpbiBQZXJpZXIgPHJvbWFpbi5wZXJpZXJA
Z21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29t
bWl0IDY0NTcwZmJjMTRmOGQ3Y2IzZmUzOTk1ZjIwZTI2YmMyNWNlNGIyY2M6Cj4gPgo+ID4gICBM
aW51eCA1LjE1LXJjNSAoMjAyMS0xMC0xMCAxNzowMTo1OSAtMDcwMCkKPiA+Cj4gPiBhcmUgYXZh
aWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiA+Cj4gPiAgIGh0dHBzOi8vZ2l0aHVi
LmNvbS9saW51eC1jaGVueGluZy9saW51eC5naXQgbXN0YXItZHQtbmV4dAo+ID4KPiA+IGZvciB5
b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA3ZTYyNmI2ZDcxZTc2NzhlODVlOWUwNmU5ZTIyNzFi
NTkyMzc0MWZkOgo+Cj4gVGhlIGNvbnRlbnRzIGFyZSBvaywgYnV0IHlvdSBoYXZlIGJhc2VkIHRo
ZSB0cmVlIG9uIC1yYzUsIHdoaWNoIHdvdWxkIHJlcXVpcmUKPiBtZSB0byBiYWNrbWVyZ2UgdGhl
IG5ldyB1cHN0cmVhbSBjb250ZW50cyBpbnRvIG15IGJyYW5jaCBhbmQgbWVzcyB1cCB0aGUKPiBn
aXQgaGlzdG9yeS4KPgo+IFBsZWFzZSByZWJhc2Ugb24gdG9wIG9mIHY1LjE1LXJjMSBhbmQgcmVz
ZW5kLgo+Cj4gICAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
