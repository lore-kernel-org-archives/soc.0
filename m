Return-Path: <SRS0=H+81=KX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED541C4708C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 May 2021 11:26:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A007E613DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 May 2021 11:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A007E613DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ni2E3MbSvh7VQWi/5+kLfXs914BtECzlgIjQnYPxuzk=; b=z5VuPd2K1wl95Q
	WzZiT1Lsb6DIM6pCe0ncHkjgwPt7jdiMzWIp7o9KPboJm4LTqP2Tjx2Y7x4B3i6+IOv89jkCDG9bR
	E5dnq0EmIAKq3jiut+2IYGGnTD4rHpQwTQDYE6dA5m/71XqIdpFHp+GbRmZXT+bu9c6SqzMcAOwFi
	QIHuZLFS8YhtUZFweh3uTWta09sXSr3GrCubFN2QiF8MiZ1G448YK7Ii6A9+6u8u/Y74F7IFdeDU2
	631G0PLgVqVMwoQ+5ocQiX57ClWCbQUSfT6UUOHKNCv4wltp4DjdH1t7iS1vlCQIOc74HvRk+z4rX
	kZCeADgUe3bzczqhnIeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmaar-00EnjH-Fm; Fri, 28 May 2021 11:23:58 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmZqP-00EQoe-UF
 for linux-arm-kernel@lists.infradead.org; Fri, 28 May 2021 10:36:00 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:751e:82a3:f2a2:3459])
 by baptiste.telenet-ops.be with bizsmtp
 id AAbs2500X20MPSF01AbsAd; Fri, 28 May 2021 12:35:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lmZqK-00AD9W-Dr; Fri, 28 May 2021 12:35:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lmXtU-007G6K-Gj; Fri, 28 May 2021 10:31:00 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas ARM DT updates for v5.14
Date: Fri, 28 May 2021 10:30:50 +0200
Message-ID: <cover.1622188835.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622188833.git.geert+renesas@glider.be>
References: <cover.1622188833.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_033558_163437_0B5F829C 
X-CRM114-Status: GOOD (  10.34  )
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
Message-ID: <20210528083050.MhxhFI9wb_zPTQ0kThnXceSGY4yUEzynUHWew8S7FeE@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBjNDY4MTU0N2JjY2U3NzdkYWY1NzY5
MjVhOTY2ZmZhODI0ZWRkMDlkOgoKICBMaW51eCA1LjEzLXJjMyAoMjAyMS0wNS0yMyAxMTo0Mjo0
OCAtMTAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZ2VlcnQvcmVuZXNhcy1k
ZXZlbC5naXQgdGFncy9yZW5lc2FzLWFybS1kdC1mb3ItdjUuMTQtdGFnMQoKZm9yIHlvdSB0byBm
ZXRjaCBjaGFuZ2VzIHVwIHRvIDFiMzJmY2U0MmJmZjg5OWRmYjliNzI5NjJmNDZjYTU1NDJjNzY0
N2M6CgogIEFSTTogZHRzOiBhbHQ6IEFkZCBTVzIgYXMgR1BJTyBrZXlzICgyMDIxLTA1LTI3IDE1
OjQ2OjIxICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpSZW5lc2FzIEFSTSBEVCB1cGRhdGVzIGZvciB2NS4xNAoK
ICAtIEdQSU8gZXh0ZW5kZXIgc3VwcG9ydCBmb3IgdGhlIEZhbGNvbiBkZXZlbG9wbWVudCBib2Fy
ZCwKICAtIFN3aXRjaGVzIHN1cHBvcnQgZm9yIHRoZSBBTFQgZGV2ZWxvcG1lbnQgYm9hcmQsCiAg
LSBNaXNjZWxsYW5lb3VzIGZpeGVzIGFuZCBpbXByb3ZlbWVudHMuCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFkYW0gRm9y
ZCAoNSk6CiAgICAgIEFSTTogZHRzOiByZW5lc2FzOiBBZGQgZmNrIHRvIGV0aGVyYXZiLXJjYXIt
Z2VuMiBjbG9jay1uYW1lcyBsaXN0CiAgICAgIGFybTY0OiBkdHM6IHJlbmVzYXM6IEFkZCBmY2sg
dG8gZXRoZXJhdmItcmNhci1nZW4zIGNsb2NrLW5hbWVzIGxpc3QKICAgICAgYXJtNjQ6IGR0czog
cmVuZXNhczogYmVhY29uIGtpdDogU2V0dXAgQVZCIHJlZmNsawogICAgICBhcm02NDogZHRzOiBy
ZW5lc2FzOiBiZWFjb246IEZpeCBVU0IgZXh0YWwgcmVmZXJlbmNlCiAgICAgIGFybTY0OiBkdHM6
IHJlbmVzYXM6IGJlYWNvbjogRml4IFVTQiByZWYgY2xvY2sgcmVmZXJlbmNlcwoKR2VlcnQgVXl0
dGVyaG9ldmVuICg0KToKICAgICAgQVJNOiBkdHM6IHI4YTc3NzksIG1hcnplbjogRml4IERVIGNs
b2NrIG5hbWVzCiAgICAgIEFSTTogZHRzOiBrb2Vsc2NoOiBSZW5hbWUgc3cyIHRvIGtleWJvYXJk
CiAgICAgIEFSTTogZHRzOiByY2FyLWdlbjE6IENvcnJlY3QgaW50ZXJuYWwgZGVsYXkgZm9yIGky
Y1sxMjNdCiAgICAgIEFSTTogZHRzOiByZW5lc2FzOiBNb3ZlIGVuYWJsZS1tZXRob2QgdG8gQ1BV
IG5vZGVzCgpOaWtsYXMgU8O2ZGVybHVuZCAoMSk6CiAgICAgIGFybTY0OiBkdHM6IHJlbmVzYXM6
IGZhbGNvbi1jc2ktZHNpOiBBZGQgR1BJTyBleHRlbmRlcnMKClZhbGVudGluZSBCYXJzaGFrICgy
KToKICAgICAgYXJtNjQ6IGR0czogcmVuZXNhczogdjNtc2s6IEZpeCBtZW1vcnkgc2l6ZQogICAg
ICBhcm02NDogZHRzOiByZW5lc2FzOiBlYWdsZTogQWRkIHgxIGNsb2NrCgpXb2xmcmFtIFNhbmcg
KDIpOgogICAgICBhcm02NDogZHRzOiByZW5lc2FzOiBjb25kb3I6IFN3aXRjaCBlTU1DIGJ1cyB0
byAxVjgKICAgICAgQVJNOiBkdHM6IGFsdDogQWRkIFNXMiBhcyBHUElPIGtleXMKCiBhcmNoL2Fy
bS9ib290L2R0cy9yOGE3NzQyLmR0c2kgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKy0KIGFy
Y2gvYXJtL2Jvb3QvZHRzL3I4YTc3NDMuZHRzaSAgICAgICAgICAgICAgICAgICAgIHwgIDQgKyst
CiBhcmNoL2FybS9ib290L2R0cy9yOGE3NzQ0LmR0c2kgICAgICAgICAgICAgICAgICAgICB8ICA0
ICsrLQogYXJjaC9hcm0vYm9vdC9kdHMvcjhhNzc0NS5kdHNpICAgICAgICAgICAgICAgICAgICAg
fCAgNCArKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3NDcwLmR0c2kgICAgICAgICAgICAgICAg
ICAgIHwgIDQgKystCiBhcmNoL2FybS9ib290L2R0cy9yOGE3Nzc4LmR0c2kgICAgICAgICAgICAg
ICAgICAgICB8ICAzICsrCiBhcmNoL2FybS9ib290L2R0cy9yOGE3Nzc5LW1hcnplbi5kdHMgICAg
ICAgICAgICAgICB8ICAyICstCiBhcmNoL2FybS9ib290L2R0cy9yOGE3Nzc5LmR0c2kgICAgICAg
ICAgICAgICAgICAgICB8ICA0ICsrKwogYXJjaC9hcm0vYm9vdC9kdHMvcjhhNzc5MC5kdHNpICAg
ICAgICAgICAgICAgICAgICAgfCAxMCArKysrKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3OTEt
a29lbHNjaC5kdHMgICAgICAgICAgICAgIHwgIDQgKy0tCiBhcmNoL2FybS9ib290L2R0cy9yOGE3
NzkxLmR0c2kgICAgICAgICAgICAgICAgICAgICB8ICA0ICsrLQogYXJjaC9hcm0vYm9vdC9kdHMv
cjhhNzc5Mi5kdHNpICAgICAgICAgICAgICAgICAgICAgfCAgNCArKy0KIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3I4YTc3OTMuZHRzaSAgICAgICAgICAgICAgICAgICAgIHwgIDMgKy0KIGFyY2gvYXJtL2Jv
b3QvZHRzL3I4YTc3OTQtYWx0LmR0cyAgICAgICAgICAgICAgICAgIHwgNDIgKysrKysrKysrKysr
KysrKysrKysrKwogYXJjaC9hcm0vYm9vdC9kdHMvcjhhNzc5NC5kdHNpICAgICAgICAgICAgICAg
ICAgICAgfCAgNCArKy0KIC4uLi9ib290L2R0cy9yZW5lc2FzL2JlYWNvbi1yZW5lc29tLWJhc2Vi
b2FyZC5kdHNpIHwgIDQgKy0tCiAuLi4vYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9iZWFjb24tcmVu
ZXNvbS1zb20uZHRzaSB8ICA4ICsrKy0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhh
Nzc0YTEuZHRzaSAgICAgICAgICB8ICAxICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9y
OGE3NzRiMS5kdHNpICAgICAgICAgIHwgIDEgKwogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L3I4YTc3NGMwLmR0c2kgICAgICAgICAgfCAgMSArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVz
YXMvcjhhNzc0ZTEuZHRzaSAgICAgICAgICB8ICAxICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yOGE3Nzk1MS5kdHNpICAgICAgICAgIHwgIDEgKwogYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL3I4YTc3OTYwLmR0c2kgICAgICAgICAgfCAgMSArCiBhcmNoL2FybTY0L2Jvb3QvZHRz
L3JlbmVzYXMvcjhhNzc5NjEuZHRzaSAgICAgICAgICB8ICAxICsKIGFyY2gvYXJtNjQvYm9vdC9k
dHMvcmVuZXNhcy9yOGE3Nzk2NS5kdHNpICAgICAgICAgIHwgIDEgKwogYXJjaC9hcm02NC9ib290
L2R0cy9yZW5lc2FzL3I4YTc3OTcwLWVhZ2xlLmR0cyAgICAgfCAgOCArKysrKwogYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTcwLXYzbXNrLmR0cyAgICAgfCAgMiArLQogYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTcwLmR0c2kgICAgICAgICAgfCAgMSArCiBhcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5ODAtY29uZG9yLmR0cyAgICB8ICA4ICstLS0t
CiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5ODAuZHRzaSAgICAgICAgICB8ICAx
ICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5MC5kdHNpICAgICAgICAgIHwg
IDEgKwogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTk1LmR0c2kgICAgICAgICAg
fCAgMSArCiAuLi4vYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzlhMC1mYWxjb24tY3NpLWRzaS5kdHNp
ICB8IDIxICsrKysrKysrKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5YTAu
ZHRzaSAgICAgICAgICB8ICA2ICsrKysKIDM0IGZpbGVzIGNoYW5nZWQsIDE0NiBpbnNlcnRpb25z
KCspLCAyNSBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
