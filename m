Return-Path: <SRS0=6ihi=JX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E967C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 16:02:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E14DF6024A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 16:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E14DF6024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ntKDSDbCRAVWJ6cwBciwZZGQAOFReTfkkEAeJFBQHa8=; b=Df9HT1hpzQvmqf46hbikqFfnZ
	Qc3uv/ptazVFqE1qVthBqPIJbXxZcXrVkUUMeoBPfVJdafSG0z30FJgfiki2SpsuWQ5l7gQ0aK2+p
	1hfRfdMFFKKLr+QtFaQC0V8MYlMVz79B56ljpVpicJP2G1ur9zVok0X3TPD8jTHtmnHRqIWktL7AT
	YSgg/0KX29eS+yHNaKxJ/jANlaPc2ibudy3hcO7YpNDjpOpPxkQ9TSh4shZBG6lTWuy2/f3SdG7CF
	jq55JvSYgyYWXJIlelPFhFWboy2yTku6dgNcICYBiv4P0NNYBd/kOqdcRfVPtWNUwAmbA49wk4FYC
	O2pF/GmJQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb3fA-0082U9-Vm; Mon, 26 Apr 2021 16:00:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb3f2-0082SR-OR
 for linux-arm-kernel@desiato.infradead.org; Mon, 26 Apr 2021 16:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
 References:MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=tN/idrTkaXskt0RMVoBt20Yb8EzTtQjH9WBfj9JwMb4=; b=2yXfJ6HFYmRyUL6eOYmzYszVhK
 zIF7ncLWg6z1xtJQG0MjXExXsaeJL8MKik2YOqX4RpdqEW34ulvdA16pSDp5d5QXIDBpnHHWmNhW7
 6YwehoZyaCEPi0Pwc1UWjMfjD33m/+DFSvyvP+YVcqB7IrLDylGfKhHuwSDcNCOssAjIbFUkJUf4l
 TR7yvKfkia/ihv+GnuZpOo+6QO24gZ8GObgA5yol904L9J5x9gx0HqdL7tg7oPFDXVLQqL7le5Uhk
 sdQjRhaWOcbSpBxjVFZqOan+jQ2zHexvpEtP9Q0RzMrDdmneI8Or7jBEItrwqZ+ZJjTuTKZTzW7X9
 wTU6pcMA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb3f0-00G4M9-0a
 for linux-arm-kernel@lists.infradead.org; Mon, 26 Apr 2021 16:00:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26D3E61175
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 26 Apr 2021 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619452833;
 bh=Ydx2c2CtDwxZOH7nIcaL66dzGtv825v3W7/m/HfxyAE=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=IAh56Qn4SFXazzMrqOsVZ2tikRT/QsQlTCsEVUtFk0PmsGrnvBQr5XGPrd1x6F4jq
 /hlA/YyMAjf5Xdb5rBGwJmQNrrSLLWKq9pDmhMz6gG8rg1+Xn0cwnvQ99eeL79J8Fi
 VXfjcia1VgxxqD5PlodsDnDHg1q0hJyajegN5rM37Kf1ydsp5h7M5rjgSKekYAHL10
 PKGv6kO3kBR+gFPBuneYXZpnTYyhfkcM/LrlegyboiV/QExVzZ1S2ttszxX5Qab9FI
 edjaxjyQ55GIvek7LYPKIg6hplyozkX7OjkbDtwLAVLe7BI/d0po7nR7lHyqda0KvO
 WNpfMgqHwUcqg==
Received: by mail-wm1-f52.google.com with SMTP id
 l189-20020a1cbbc60000b0290140319ad207so3034187wmf.2
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 26 Apr 2021 09:00:33 -0700 (PDT)
X-Gm-Message-State: AOAM532pIyRLiaufdlnnkfl3r+58/o4AamI0yn/aUJe0q7yJzJAyO/jl
 r/8U6aOy+NemZGezB10QuUb8V8ucYdV9Mc0+qUo=
X-Google-Smtp-Source: ABdhPJyjYkHYSNOxgoAHIsP9jTRhx2A9a7Mz3/O7zxXBct6dnysCATm4L/z1YzkVyrNq9td1AEYr/73P20dJKL4e6Jg=
X-Received: by 2002:a7b:c344:: with SMTP id l4mr21479066wmj.120.1619452831641; 
 Mon, 26 Apr 2021 09:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
In-Reply-To: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 26 Apr 2021 18:00:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2apTEYei_w6+_dM5a6ZD+QCA65x9hDjVWe2ueVO2C_dw@mail.gmail.com>
Message-ID: <CAK8P3a2apTEYei_w6+_dM5a6ZD+QCA65x9hDjVWe2ueVO2C_dw@mail.gmail.com>
Subject: [GIT PULL 5/6] ARM: platform support for Nuvoton WPCM450
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_090034_147667_FD0C0A27 
X-CRM114-Status: GOOD (  16.20  )
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
Message-ID: <20210426160002.3rE5LYCo_O14g4Khw8dBbrDMr7t6N6ueq5ZB-tLZGzk@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBhMzhmZDg3NDg0NjQ4MzE1ODRhMTk0
MzhjYmIzMDgyYjVhMmRhYjE1OgoKICBMaW51eCA1LjEyLXJjMiAoMjAyMS0wMy0wNSAxNzozMzo0
MSAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc29jL3NvYy5naXQgdGFn
cy9hcm0tbmV3c29jLTUuMTMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAzOWI5NTA3
OWY2OGNmMTc4ODhhNGNlZTkzYWQzYzRhY2MzODU0YjM4OgoKICBNZXJnZSB0YWcgJ2JtYy01LjEz
LXdwY200NTAnIG9mCmdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9qb2VsL2JtYyBpbnRvIGFybS9uZXdzb2MKKDIwMjEtMDQtMDkgMDk6MDI6NTUgKzAyMDApCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCkFSTTogcGxhdGZvcm0gc3VwcG9ydCBmb3IgTnV2b3RvbiBXUENNNDUwCgpUaGUgTnV2
b3RvbiBXUENNNDUwIEJNQyBpcyBhbiBvbGRlciBjaGlwIGJhc2VkIG9uIHRoZSBBUk05MjYgQ1BV
IGNvcmUKdGhhdCByZW1haW5zIGluIHVzZSBvbiBTdXBlcm1pY3JvIFg5IHNlcnZlciBib2FyZHMg
YW1vbmcgb3RoZXJzLiBTdXBwb3J0CmdldHMgYWRkZWQgZm9yIGEgcGFydGljdWxhciBzZXJ2ZXIg
Ym9hcmQgdXNpbmcgdGhpcyBTb0MgYWxvbmcgd2l0aCB0aGUKYmFzaWMgcGxhdGZvcm0gYnJpbmd1
cC4KCkFzIHRoZSBwbGF0Zm9ybSBpcyBhIHByZWRlY2Vzc29yIHRvIHRoZSBucGNtN3h4IHBsYXRm
b3JtIHdlIGFscmVhZHkKc3VwcG9ydCwgaXQgaXMgYWRkZWQgdG8gdGhlIHNhbWUgZGlyZWN0b3J5
LCBkZXNwaXRlIHVzaW5nIGEgZGlmZmVyZW50Cm5hbWUuIEl0IGFsc28gc2VlbXMgdG8gYmUgcmVs
YXRlZCB0byB0aGUgb2xkZXIgdzkweDkwMC9udWM5eHggcGxhdGZvcm0KdGhhdCB3YXMgcmVtb3Zl
ZCBsYXN0IHllYXIuCgpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRl
PgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpBcm5kIEJlcmdtYW5uICgxKToKICAgICAgTWVyZ2UgdGFnICdibWMtNS4xMy13
cGNtNDUwJyBvZgpnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
am9lbC9ibWMgaW50byBhcm0vbmV3c29jCgpKb2VsIFN0YW5sZXkgKDEpOgogICAgICBBUk06IGNv
bmZpZzogQWRkIFdQQ00gdG8gbXVsdGkgdjUKCkpvbmF0aGFuIE5ldXNjaMOkZmVyICgxMCk6CiAg
ICAgIGR0LWJpbmRpbmdzOiBhcm06IENvbnZlcnQgbnV2b3RvbixucGNtNzUwIGJpbmRpbmcgdG8g
WUFNTAogICAgICBBUk06IGR0czogQWRkIGJvYXJkLXNwZWNpZmljIGNvbXBhdGlibGUgc3RyaW5n
IHRvIG5wY203NTAtZXZiIGRldmljZXRyZWUKICAgICAgZHQtYmluZGluZ3M6IHZlbmRvci1wcmVm
aXhlczogQWRkIFN1cGVybWljcm8KICAgICAgZHQtYmluZGluZ3M6IGFybTogbnBjbTogQWRkIG51
dm90b24sd3BjbTQ1MCBjb21wYXRpYmxlIHN0cmluZwogICAgICBkdC1iaW5kaW5nczogd2F0Y2hk
b2c6IG5wY206IEFkZCBudXZvdG9uLHdwY200NTAtd2R0CiAgICAgIEFSTTogbnBjbTogSW50cm9k
dWNlIE51dm90b24gV1BDTTQ1MCBTb0MKICAgICAgd2F0Y2hkb2c6IG5wY206IEFkZCBzdXBwb3J0
IGZvciBXUENNNDUwCiAgICAgIEFSTTogZHRzOiBBZGQgZGV2aWNldHJlZSBmb3IgTnV2b3RvbiBX
UENNNDUwIEJNQyBjaGlwCiAgICAgIEFSTTogZHRzOiBBZGQgZGV2aWNldHJlZSBmb3IgU3VwZXJt
aWNybyBYOVNDaS1MTjRGIGJhc2VkIG9uIFdQQ000NTAKICAgICAgTUFJTlRBSU5FUlM6IEFkZCBl
bnRyeSBmb3IgTnV2b3RvbiBXUENNNDUwCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL25w
Y20vbnBjbS50eHQgICAgICAgICAgfCAgNiAtLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L25wY20vbnBjbS55YW1sICAgICAgICAgfCAyOSArKysrKysrKysKIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sICAgICAgIHwgIDIgKwogLi4uL2JpbmRpbmdzL3dh
dGNoZG9nL251dm90b24sbnBjbS13ZHQudHh0ICAgICAgICAgfCAgMyArLQogTUFJTlRBSU5FUlMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOSArKysKIGFyY2gvYXJt
L2Jvb3QvZHRzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKwogYXJjaC9h
cm0vYm9vdC9kdHMvbnV2b3Rvbi1ucGNtNzUwLWV2Yi5kdHMgICAgICAgICAgfCAgMiArLQogLi4u
L2R0cy9udXZvdG9uLXdwY200NTAtc3VwZXJtaWNyby14OXNjaS1sbjRmLmR0cyAgfCA0MCArKysr
KysrKysrKysKIGFyY2gvYXJtL2Jvb3QvZHRzL251dm90b24td3BjbTQ1MC5kdHNpICAgICAgICAg
ICAgIHwgNzYgKysrKysrKysrKysrKysrKysrKysrKwogYXJjaC9hcm0vY29uZmlncy9tdWx0aV92
NV9kZWZjb25maWcgICAgICAgICAgICAgICAgfCAgMyArCiBhcmNoL2FybS9tYWNoLW5wY20vS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICAgICB8IDEyICsrKy0KIGFyY2gvYXJtL21hY2gtbnBj
bS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogYXJjaC9hcm0vbWFjaC1u
cGNtL3dwY200NTAuYyAgICAgICAgICAgICAgICAgICAgICAgfCAxMyArKysrCiBkcml2ZXJzL3dh
dGNoZG9nL25wY21fd2R0LmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIDE0IGZpbGVz
IGNoYW5nZWQsIDE5MCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbnBjbS9ucGNtLnR4
dAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vbnBjbS9ucGNtLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy9u
dXZvdG9uLXdwY200NTAtc3VwZXJtaWNyby14OXNjaS1sbjRmLmR0cwogY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL251dm90b24td3BjbTQ1MC5kdHNpCiBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC9hcm0vbWFjaC1ucGNtL3dwY200NTAuYwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QK
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
