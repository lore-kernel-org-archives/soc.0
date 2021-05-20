Return-Path: <SRS0=3stN=KP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F829C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 May 2021 21:07:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FBB2611AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 May 2021 21:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FBB2611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aKGwxXPy//6lLWdCFExcxxeO4H/tmvdP/9MsFL5uNrw=; b=m/ArwLER8iS+x1oCJrF9bEWxw3
	H3SK8UuM3w+DNPq2uvs4bmYbE+yHRChB/0jsuYPe9hpUSlVXN6TqRqEIH4CpjqH1ba5CD/Kjg4aR6
	IxpluPmzouaikFeHXycqvdeRxA+fuectfbwy2RThU3UnfJKy6Mrr9RawZ7Gy5tPUKBNl/tZtMY0Qt
	0fzx7eXKJFWwArXmQRfX6IDPZUdjku+7BUMCG90BBeEvAgcO1+NfMVjUsZPqqNqkwK6oh25xQRXDK
	z8FaDVYyGduXE03+Z2jxKipAKbLGI3Afg40su2tqlHgR2PiksIFiuJzuKyLofOk7s0jLRV7R4Mu0b
	i2cWW4OA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljprN-002jZI-3z; Thu, 20 May 2021 21:05:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljprI-002jYg-Tr
 for linux-arm-kernel@desiato.infradead.org; Thu, 20 May 2021 21:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=LrjaFQFp10S8Y+cGFD0S/bUHh4sXXuH8PGUdh3kgrpU=; b=GjMsxE9FvxqkGKJgtjKhnaLrEj
 bUtkXuzbdjtxz7nUF9wzcsH2B08Ws/3ZNGDe5vqHeIVokDUKCeMKFLQ/4nRngCKyhHdSQ8oV06fK0
 j40o1H+Im/y4Vvr/xd5QcwAsxVV+EGENSJ0CS3FUWlrRceC6NER+/s1Iu+pSsMepa74ndplZ8m/xZ
 du9PtR0pKG1GfKV3//A4BP23C0E4b3GavrNe//AUU6CVye7SmkKPqbhtTprYhNMoaXB4JFRiP+Ms9
 MS2VpTbWEyKCbHMRoy1iatmrdLlQNgJfpAvxPDDDmrkWHZAFDLff0q8eMuuey/ju3zI2KTFBkR0YK
 MQwhN0fQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljprG-00GfD9-8f
 for linux-arm-kernel@lists.infradead.org; Thu, 20 May 2021 21:05:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 049B8613AC
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 20 May 2021 21:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621544729;
 bh=UTDKHiT9mxi/k5ajBmutcPFW3PB9zuAxnDBhiqNMNo4=;
 h=From:Date:Subject:To:List-Id:Cc:From;
 b=AmOCIGxskkivvlze+Hm5gQ0XauimD8o78kCrqW8MGXgwyjUxd+U+sD2+uOmYEt9EB
 Qm0tQts0EHoPRF+HI/IinLRjNgSpCLLn2t0OjMOBM9qaE6WyPGbxezYV1UxZ8PIkbv
 8RQAUi5ESK07z1ikmEmh2zFOJQbv04I1ePGd0mZvkdVO+FgbqYo7T29D3Fwn6/XXL6
 4iPZaUlAIxFhOxm2x+VC3dqmpahUHWd9gSTH/eSbAYnA26J4jEO1uirSPAZXanJkNq
 8BmdrQT1bExHIUIWcKIxizLzz5K7fFXYTxtxnNAinK42KuHmCAKZYU75xsOeUQs7oH
 yUrafaoTDLWHA==
Received: by mail-wr1-f41.google.com with SMTP id a4so19038664wrr.2
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 20 May 2021 14:05:28 -0700 (PDT)
X-Gm-Message-State: AOAM532+ILCzSnG1hlpQIdbEJVLLuSdhfz/12/w/hwd3Y95UdxMubsWP
 bOBPIEF8+aQJ/uRus1RbQ0A1CUwNlUjw4mab47M=
X-Google-Smtp-Source: ABdhPJzb00tPeY0iI0+x13tVJzMvgXKuWxutYWrQGoq2U36CUtRRZx/hQPAGNhtAzxXIz5eaXJz2vot40CG9QxMCslU=
X-Received: by 2002:a5d:6dc4:: with SMTP id d4mr6276565wrz.105.1621544727665; 
 Thu, 20 May 2021 14:05:27 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 20 May 2021 23:04:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0QqwkGDabWzD+oDp7jsfkuLEaFxmCaHBuu_HVd4TxLXg@mail.gmail.com>
Message-ID: <CAK8P3a0QqwkGDabWzD+oDp7jsfkuLEaFxmCaHBuu_HVd4TxLXg@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for 5.13
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_140530_368262_D276EA05 
X-CRM114-Status: GOOD (  13.68  )
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
Message-ID: <20210520210412.UXbfbcSYqiNXjgxizZkuvgkiBSsd-NT8BHFRFX0_4nE@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAwYzg1NTU2MzE4MjAwMWM4MjkwNjVm
YWExN2Y4ZTI5ZTljZWZmZTEzOgoKICBNZXJnZSB0YWcgJ2FybS1hcHBsZS1tMS01LjEzJyBvZgpn
aXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc29jL3NvYyAoMjAy
MS0wNC0yNgoxMjozMDozNiAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0
b3J5IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
c29jL3NvYy5naXQKdGFncy9hcm0tc29jLWZpeGVzLTUuMTMtMQoKZm9yIHlvdSB0byBmZXRjaCBj
aGFuZ2VzIHVwIHRvIGQzNzMxNmI3MmU4YmY5NWE1MmQxYzNlOTNjODIzZDEyOGMwOWI1MjE6Cgog
IEFSTTogbnBjbTogd3BjbTQ1MDogc2VsZWN0IGludGVycnVwdCBjb250cm9sbGVyIGRyaXZlciAo
MjAyMS0wNS0xOAoxNToyNzoyNyArMDIwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQVJNOiBTb0MgZml4ZXMgZm9yIDUu
MTMKCk9ubHkgYSBzbWFsbCBudW1iZXIgb2YgZml4ZXMgc28gZmFyLCBpbmNsdWRpbmcgc29tZSB0
aGF0IEkgaGFkIGFwcGxpZWQKZHVyaW5nIHRoZSBtZXJnZSB3aW5kb3csIHNvIHRoaXMgaXMgYmFz
ZWQgb24gdGhlIG9yaWdpbmFsIG1lcmdlIG9mIHRoZQpvdGhlciBicmFuY2hlcy4KCiAtIFRoZSBs
YXJnZXN0IGNoYW5nZSBpcyBhIGZpeCBmb3IgYSByZWZlcmVuY2UgY291bnRpbmcgYnVnIGluCiAg
IHRoZSBBTUQgVEVFIGRyaXZlci4KCiAtIE5laWwgQXJtc3Ryb25nIG5vdyBjby1tYWludGFpbnMg
QW1sb2dpYyBTb0Mgc3VwcG9ydAoKIC0gVHdvIGJ1aWxkIHdhcm5pbmcgZml4ZXMgZm9yIHJlbmVz
YXMgZGV2aWNlIHRyZWUgZmlsZXMKCiAtIEEgc2lnbiBleHBhbnNpb24gYnVnIGZvciBvcHRlZQoK
IC0gQSBEVCBiaW5kaW5nIGZpeCBmb3IgYSBtaXNtZXJnZQoKU2lnbmVkLW9mZi1ieTogQXJuZCBC
ZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQXJuZCBCZXJnbWFubiAoNCk6CiAgICAg
IGR0LWJpbmRpbmdzOiBudm1lbTogbWVkaWF0ZWs6IHJlbW92ZSBkdXBsaWNhdGUgbXQ4MTkyIGxp
bmUKICAgICAgTWVyZ2UgdGFnICdzY21pLWZpeGVzLTUuMTMnIG9mCmdpdDovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdWRlZXAuaG9sbGEvbGludXggaW50bwphcm0v
Zml4ZXMKICAgICAgTWVyZ2UgdGFnICdyZW5lc2FzLWFybS1kdC1mb3ItdjUuMTMtdGFnMycgb2YK
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dlZXJ0L3JlbmVz
YXMtZGV2ZWwgaW50bwphcm0vZml4ZXMKICAgICAgTWVyZ2UgdGFnICdhbWR0ZWUtZml4ZXMtZm9y
LXY1LjEzJyBvZgpnaXQ6Ly9naXQubGluYXJvLm9yZy9wZW9wbGUvamVucy53aWtsYW5kZXIvbGlu
dXgtdGVlIGludG8gYXJtL2ZpeGVzCgpEYW4gQ2FycGVudGVyICgxKToKICAgICAgZmlybXdhcmU6
IGFybV9zY3BpOiBQcmV2ZW50IHRoZSB0ZXJuYXJ5IHNpZ24gZXhwYW5zaW9uIGJ1ZwoKSm9uYXRo
YW4gTmV1c2Now6RmZXIgKDEpOgogICAgICBBUk06IG5wY206IHdwY200NTA6IHNlbGVjdCBpbnRl
cnJ1cHQgY29udHJvbGxlciBkcml2ZXIKCktldmluIEhpbG1hbiAoMSk6CiAgICAgIE1BSU5UQUlO
RVJTOiBBUk0vQW1sb2dpYyBTb0NzOiBhZGQgTmVpbCBhcyBwcmltYXJ5IG1haW50YWluZXIKCk5p
a2xhcyBTw7ZkZXJsdW5kICgyKToKICAgICAgYXJtNjQ6IGR0czogcmVuZXNhczogYWlzdGFydmlz
aW9uLW1pcGktYWRhcHRlci0yLjE6IEZpeCBDU0k0MCBwb3J0cwogICAgICBhcm02NDogZHRzOiBy
ZW5lc2FzOiBBZGQgcG9ydEAwIG5vZGUgZm9yIGFsbCBDU0ktMiBub2RlcyB0byBkdHNpCgpSaWpv
IFRob21hcyAoMSk6CiAgICAgIHRlZTogYW1kdGVlOiB1bmxvYWQgVEEgb25seSB3aGVuIGl0cyBy
ZWZjb3VudCBiZWNvbWVzIDAKCldhbiBKaWFiaW5nICgxKToKICAgICAgZmlybXdhcmU6IGFybV9z
Y21pOiBSZW1vdmUgZHVwbGljYXRlIGRlY2xhcmF0aW9uIG9mIHN0cnVjdApzY21pX3Byb3RvY29s
X2hhbmRsZQoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL210ay1lZnVzZS50eHQgICAg
ICAgIHwgIDEgLQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQogYXJjaC9hcm0vbWFjaC1ucGNtL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMSArCiAuLi5ob3BlLXJ6ZzItZXgtYWlzdGFydmlzaW9uLW1pcGktYWRhcHRl
ci0yLjEuZHRzaSB8ICAyIC0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRhMS5k
dHNpICAgICAgICAgIHwgIDggKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRi
MS5kdHNpICAgICAgICAgIHwgIDggKysKIC4uLi9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGMwLWVr
ODc0LW1pcGktMi4xLmR0cyAgIHwgIDIgKy0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9y
OGE3NzRjMC5kdHNpICAgICAgICAgIHwgIDQgKwogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L3I4YTc3NGUxLmR0c2kgICAgICAgICAgfCAgOCArKwogYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I4YTc3OTUwLmR0c2kgICAgICAgICAgfCAgNCArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcjhhNzc5NTEuZHRzaSAgICAgICAgICB8IDEyICsrKwogYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3I4YTc3OTYwLmR0c2kgICAgICAgICAgfCAgOCArKwogYXJjaC9hcm02NC9ib290
L2R0cy9yZW5lc2FzL3I4YTc3OTYxLmR0c2kgICAgICAgICAgfCAgOCArKwogYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3I4YTc3OTY1LmR0c2kgICAgICAgICAgfCAgOCArKwogYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTcwLmR0c2kgICAgICAgICAgfCAgNCArCiBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5ODAuZHRzaSAgICAgICAgICB8ICA4ICsrCiBhcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAtZWJpc3UuZHRzICAgICB8ICAyIC0KIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5MC5kdHNpICAgICAgICAgIHwgIDQgKwog
YXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3NhbHZhdG9yLWNvbW1vbi5kdHNpICAgfCAgMyAt
CiBkcml2ZXJzL2Zpcm13YXJlL2FybV9zY21pL25vdGlmeS5oICAgICAgICAgICAgICAgICB8ICAy
IC0KIGRyaXZlcnMvZmlybXdhcmUvYXJtX3NjcGkuYyAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDQgKy0KIGRyaXZlcnMvdGVlL2FtZHRlZS9hbWR0ZWVfcHJpdmF0ZS5oICAgICAgICAgICAgICAg
IHwgMTMgKysrCiBkcml2ZXJzL3RlZS9hbWR0ZWUvY2FsbC5jICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDk0ICsrKysrKysrKysrKysrKysrKystLS0KIGRyaXZlcnMvdGVlL2FtZHRlZS9jb3Jl
LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTUgKystLQogMjQgZmlsZXMgY2hhbmdlZCwg
MTk2IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QK
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
