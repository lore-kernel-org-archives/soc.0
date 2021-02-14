Return-Path: <SRS0=BbVa=HQ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E7FC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Feb 2021 22:40:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 145BD64DF4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Feb 2021 22:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 145BD64DF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N9fCuKXtyAy0y2YnIXlSZg0ntk9CAsUaev3cf5+xSfY=; b=zBWhfR1IZpsPK1R05ZEDysV4YT
	uRFOa8Ao4jVe341AK4idBYNpZRu0aDdH3sVieUQ8JBpnIrn8H6elDWw9qPI+ZfT8upsLMHm0pRp04
	zW1hDP9aaZAhgm02fxAxj9BZA6YmbaFCgEE76byguT41SGLucrbE+qUIJoj54r6osd4PTGNVtJXC0
	h8UirI0Mzb9NBFMfIT+kEli478TopauNdXw/AbIVx7ihqxg+SvUTYwsPO2J2Z22yKi1v+GPBwZdqK
	HWjfTVS25vG8h2OSaSvGQVkdVhI6y6g2lRhOtfsSt+HYU/oVkaJOBhMgS0ePTCP70qSMzx6ckH3Qy
	TASL2MJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBQ29-0007MQ-3i; Sun, 14 Feb 2021 22:38:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBQ22-0007M1-Jl
 for linux-arm-kernel@lists.infradead.org; Sun, 14 Feb 2021 22:38:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8ECC164E08
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 14 Feb 2021 22:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613342300;
 bh=2wALrn8VAAbK/1x1XX+Lop9OH26WAwPXH9B1Wn+KeHc=;
 h=From:Date:Subject:List-Id:To:From;
 b=gjAXr4NHD4s2/2xlbf5/XJpLIh5JZ/zfO/oRNkXaq2QoARTQbyTTOkATaj4c8N4q6
 rW+q+nuZ/gpAGSyr5kFF1mAPpLjdWMPqH2bmebYzJiBPL5zhAdTFD9zwJoeu8TKfav
 AaaTWPfCvlQ1vXijke2fGGVYQC/vwbNqnZ/xE1IWt6Zc5T4upWXAkaK9vVBg22byPC
 Dm/mHr3yxQzn6iUkuZcVU311cOayxY4+fqfEE5kDcc5keA3kvDZcMFv6zLDVL8K8PF
 Ll22XK4tPK32NfZ57+/2NNod4YtfHEdqyN/mFdgXwuy1zfgq90j4Z5ZZH0l9h+bZZA
 s/Yf0dIwNqcSw==
Received: by mail-ot1-f53.google.com with SMTP id c16so4560190otp.0
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 14 Feb 2021 14:38:20 -0800 (PST)
X-Gm-Message-State: AOAM5325D5Ymzl24Hci6JRmSEEs7WqIhXFL925dSHx/oOouJy3voBMqV
 HjoL0mGeC4myDdMx81z/02dAtsYXk3vUe8WTEK4=
X-Google-Smtp-Source: ABdhPJxhKcABtd+TMhOp7xAMleHJyMln/77KiRekZ5trzivBzHsFc5dt8UPOdtw5SFO5oDoTd8snKP9tsF/7pnqUR+M=
X-Received: by 2002:a05:6830:18e6:: with SMTP id
 d6mr9895956otf.251.1613342299853; 
 Sun, 14 Feb 2021 14:38:19 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 14 Feb 2021 23:38:03 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
Message-ID: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
Subject: [GIT PULL 0/6] ARM SoC changes for v5.12
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210214_173822_796946_57F568B6 
X-CRM114-Status: GOOD (  12.71  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210214223803.GjIKEZvDpVF7dQe9MlRKz22wxHNnps4w9DEnUdEx2zQ@z>

NS4xMiBzZWVtcyB0byBiZSBhIGZhaXJseSBxdWlldCByZWxlYXNlIGZvciB0aGUgU29DIHRyZWUu
IFRoZSBtYWluCmhpZ2hsaWdodHMgYXJlOgoKIC0gUmVtb3Zpbmcgc2l4IG9mIHRoZSBvbGRlciBw
bGF0Zm9ybXMgdGhhdCBoYXZlIG5vIGtub3duIHVzZXJzLCBhcyB3ZWxsCiAgIGFzIHRoZSBhcmNo
L2M2eCBhcmNoaXRlY3R1cmUuIERlc3BpdGUgYWxsIHRoYXQgcmVtb3ZlZCBjb2RlLCB0aGVyZSBp
cyBzdGlsbAogICBhIHNtYWxsIG92ZXJhbGwgZ3Jvd3RoOgogICA5MDcgZmlsZXMgY2hhbmdlZCwg
MzM4ODggaW5zZXJ0aW9ucygrKSwgMjY5MTggZGVsZXRpb25zKC0pCiAgIEkgc2VudCBwYXRjaGVz
IHRvIHJlbW92ZSBhbiBhZGRpdGlvbmFsIDUwODc1IGxpbmVzIG9mIGRyaXZlciBjb2RlIGZvciB0
aGVzZQogICBwbGF0Zm9ybXMsIGJ1dCB0aG9zZSBwYXRjaGVzIGFyZSBtZXJnZWQgdGhyb3VnaCBv
dGhlciBzdWJzeXN0ZW0gdHJlZXMuCgotIFN1cHBvcnQgZm9yIHRocmVlIGFkZGl0aW9uYWwgU29D
czogQnJvYWRjb20gQkNNNDkwOCBpcyB1c2VkIGluIHdpcmVsZXNzCiAgcm91dGVycywgUXVhbGNv
bW0gU25hcGRyYWdvbiA4ODggaXMgdGhlIGxhdGVzdCBoaWdoLWVuZCBwaG9uZSBjaGlwIGFuZAog
IFF1YWxjb21tIFg1NSBpcyB0aGUgYSA1RyBtb2RlbSBjaGlwIHRoYXQgY2FuIGFsc28gcnVuIGFz
IGEgc3RhbmRhbG9uZSBTb0MKCi0gU3VwcG9ydCBmb3IgdGhlIEFwcGxlIE0xIGlzIGNvbWluZyB1
cCBuaWNlbHksIGJ1dCBkaWRuJ3QgbWFrZSB0aGUgY3V0IHRoaXMKICB0aW1lIGFzIHRoZXJlIGFy
ZSBzdGlsbCBzb21lIGZ1bmRhbWVudGFsIGRlY2lzaW9ucyB0byBiZSBtYWRlLCBleHBlY3QgdGhp
cwogIHRvIGJlIGFkZGVkIGZvciB2NS4xMy4KCi0gQW1vbmcgdGhlIG5ld2x5IHN1cHBvcnRlZCBi
b2FyZHMsIHRoZXJlIGFyZSBvbmNlIG1vcmUgYSBudW1iZXIgb2Ygb2xkZXIKICBtb2JpbGUgcGhv
bmVzIGFuZCB0YWJsZXMsIGFzIHdlbGwgYXMgbW9kZXJuIGRldmVsb3BtZW50IHBsYXRmb3JtcyBh
bmQKICBpbmR1c3RyaWFsIG1hY2hpbmVzCgotIEEgdG90YWwgb2YgNzUyIG5vbi1tZXJnZSBjaGFu
Z2VzZXRzIHdlcmUgd3JpdHRlbiBieSAxODcgaW5kaXZpZHVhbAogIGRldmVsb3BlcnMuIFRoZSBz
aXggYnJhbmNoZXMgY29udGFpbiA3OCBwdWxsIHJlcXVlc3RzIGZyb20gMjkgZG93bnN0cmVhbQog
IG1haW50YWluZXJzLCBhcyB3ZWxsIGFzIGEgc21hbGwgbnVtYmVyIG9mIHBhdGNoZXMgdGhhdCBJ
IGFwcGxpZWQgZGlyZWN0bHkuCgo9PT0gVG9wIDIwIGNvbnRyaWJ1dG9ycyBieSBudW1iZXIgb2Yg
cGF0Y2hlcyA9PT0KCiAgICAgMzQgTWFuaXZhbm5hbiBTYWRoYXNpdmFtCiAgICAgMzAgQWRhbSBG
b3JkCiAgICAgMjYgS29ucmFkIER5YmNpbwogICAgIDI1IERtaXRyeSBCYXJ5c2hrb3YKICAgICAx
OSBNYXhpbWUgUmlwYXJkCiAgICAgMTggT2xla3NpaiBSZW1wZWwKICAgICAxNyBNaWNoYWwgU2lt
ZWsKICAgICAxNyBLcnp5c3p0b2YgS296bG93c2tpCiAgICAgMTYgTWljaGFlbCBXYWxsZQogICAg
IDE2IEpvaGFuIEpvbmtlcgogICAgIDE1IFZpbm9kIEtvdWwKICAgICAxNCBHdXN0YXZlIE1vbmNl
CiAgICAgMTIgTHVib21pciBSaW50ZWwKICAgICAxMSBSYWZhxYIgTWnFgmVja2kKICAgICAxMSBN
YXJ0aW4gS2VwcGxpbmdlcgogICAgIDExIENyaXN0aWFuIENpb2NhbHRlYQogICAgIDExIEFuZHJl
IFByenl3YXJhCiAgICAgMTAgTGludXMgV2FsbGVpagogICAgIDEwIEd1aWRvIEfDvG50aGVyCiAg
ICAgIDkgWmhlbiBMZWkKCj09PSBEaXJzdGF0ID09PQogICAyLjglIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy8KICAyOC4zJSBhcmNoL2FybS9ib290L2R0cy8KICAgMS40JSBhcmNo
L2FybS9tYWNoLXByaW1hMi8KICAgMS4xJSBhcmNoL2FybS9tYWNoLXUzMDAvCiAgIDMuMCUgYXJj
aC9hcm0vCiAgIDEuNiUgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljLwogICA4LjUlIGFyY2gv
YXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlLwogICAxLjAlIGFyY2gvYXJtNjQvYm9vdC9kdHMvaGlz
aWxpY29uLwogICA0LjMlIGFyY2gvYXJtNjQvYm9vdC9kdHMvbnZpZGlhLwogIDExLjYlIGFyY2gv
YXJtNjQvYm9vdC9kdHMvcWNvbS8KICAgNC4wJSBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMv
CiAgIDEuNSUgYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC8KICAgMS4xJSBhcmNoL2FybTY0
L2Jvb3QvZHRzL3hpbGlueC8KICAgMS40JSBhcmNoL2FybTY0L2Jvb3QvZHRzL3p0ZS8KICAgMi41
JSBhcmNoL2FybTY0L2Jvb3QvZHRzLwogICAxLjElIGFyY2gvYzZ4L2Jvb3QvZHRzLwogICAzLjMl
IGFyY2gvYzZ4L2luY2x1ZGUvYXNtLwogICA1LjUlIGFyY2gvYzZ4L2tlcm5lbC8KICAgMS43JSBh
cmNoL2M2eC9saWIvCiAgIDQuNCUgYXJjaC9jNngvcGxhdGZvcm1zLwogICAxLjclIGFyY2gvYzZ4
LwogICAxLjAlIGRyaXZlcnMvbWVtb3J5LwogICAzLjklIGRyaXZlcnMvc29jLwogICAxLjAlIGRy
aXZlcnMvdGVlL29wdGVlLwoKICAgICAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
