Return-Path: <SRS0=Uu9Z=I7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4C6C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Apr 2021 10:40:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3D1D60FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Apr 2021 10:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3D1D60FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H7nxxwmEE0sfG+z/nWmsQC8JgK/gCqNsEwVQtPWKGz4=; b=cG0hqfWJHlRGxjRT7xT1FcoizD
	DXL4ehO6TsJXeCRN+keJh79pLmLMuPww9EzyoBGUTQ9t2m7KIyS3bgAkIN+pFIudBw5j75gxX4NKl
	EG5cJPIaKgJi6vl6OoOUekRgGSt+5+KtIfsKpt5i4LHW5qHTXkMGlVZCwDGAOz1lY98ZIC49kClKR
	SwXyF2zjRMcV0DkIFZWGGI0fMEKkePeGmisYmfWnYfNnrQ8JrkDa2pikqfDVZP4nkq1DUYof3nSdW
	vP1dfjL0EPDOCnGElfxoGrzOm+b1MHm38kbuePtny5XO4fojvGtlQITchA8s9yYJjLuZerAVgWFjx
	QFXkEjew==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSHCS-00Cmyw-Pp; Fri, 02 Apr 2021 10:38:49 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSHBD-00CmXB-MO
 for linux-arm-kernel@lists.infradead.org; Fri, 02 Apr 2021 10:37:53 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7c3c:adbc:7a1a:b85f])
 by baptiste.telenet-ops.be with bizsmtp
 id nmdS240034A7w6i01mdSwB; Fri, 02 Apr 2021 12:37:28 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lSHB7-00CQRR-Ll; Fri, 02 Apr 2021 12:37:25 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lSHB7-004Bkq-0e; Fri, 02 Apr 2021 12:37:25 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas ARM DT updates for v5.13 (take two)
Date: Fri,  2 Apr 2021 12:37:15 +0200
Message-ID: <cover.1617359678.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_113733_065769_D38E1A5B 
X-CRM114-Status: GOOD (  14.94  )
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
Message-ID: <20210402103715.lduR5j9c9DClCFSv2s05ySAWQQZJ6fMaHahqhdRT39s@z>

CUhpIGFybS1zb2MgZm9sa3MsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGM4
YWViYzEzNDY1MjJkMzU2OTY5MDg2N2NlMzk5NjY0MmFkNTJlMDE6CgogIGFybTY0OiBkdHM6IHJl
bmVzYXM6IHI4YTc3OTgwOiBGaXggdmluNC03IGVuZHBvaW50IGJpbmRpbmcgKDIwMjEtMDMtMTYg
MDk6NTg6MDAgKzAxMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoK
CiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dlZXJ0L3Jl
bmVzYXMtZGV2ZWwuZ2l0IHRhZ3MvcmVuZXNhcy1hcm0tZHQtZm9yLXY1LjEzLXRhZzIKCmZvciB5
b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAyYjM1Y2EyZmU2MDVmODVhYTFhNTJjNzEzNTcxYmFm
MDRhNWY0MzRhOgoKICBhcm02NDogZHRzOiByZW5lc2FzOiB1bGNiOiBBZGQgY3B1LXN1cHBseSBw
cm9wZXJ0eSB0byBhNTdfMCBub2RlICgyMDIxLTA0LTAyIDA5OjIyOjM1ICswMjAwKQoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpSZW5lc2FzIEFSTSBEVCB1cGRhdGVzIGZvciB2NS4xMyAodGFrZSB0d28pCgogIC0gVmlkZW8g
SU4gKFZJTikgYW5kIENhbWVyYSAoQ1NJLTIpIHN1cHBvcnQgZm9yIHRoZSBSLUNhciBNMy1XKyBT
b0MsCiAgLSBMRUQgc3VwcG9ydCBmb3IgdGhlIEZhbGNvbiBkZXZlbG9wbWVudCBib2FyZCwKICAt
IFByZXBhcmF0b3J5IGRpc3BsYXkgcGlwZWxpbmUgc3VwcG9ydCBmb3IgdGhlIFItQ2FyIFYzVSBT
b0MsCiAgLSBNaXNjZWxsYW5lb3VzIGZpeGVzIGFuZCBpbXByb3ZlbWVudHMuCgpUaGFua3MgZm9y
IHB1bGxpbmchCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCkRpZW4gUGhhbSAoMSk6CiAgICAgIGFybTY0OiBkdHM6IHJlbmVz
YXM6IHNhbHZhdG9yLWNvbW1vbjogQWRkIGNwdS1zdXBwbHkgcHJvcGVydHkgdG8gYTU3XzAgbm9k
ZQoKR2VlcnQgVXl0dGVyaG9ldmVuICg1KToKICAgICAgYXJtNjQ6IGR0czogcmVuZXNhczogZmFs
Y29uOiBNb3ZlIGNvbnNvbGUgY29uZmlnIHRvIENQVSBib2FyZCBEVFMKICAgICAgYXJtNjQ6IGR0
czogcmVuZXNhczogZmFsY29uOiBNb3ZlIHdhdGNoZG9nIGNvbmZpZyB0byBDUFUgYm9hcmQgRFRT
CiAgICAgIGFybTY0OiBkdHM6IHJlbmVzYXM6IGZhbGNvbjogTW92ZSBBVkIwIHRvIG1haW4gRFRT
CiAgICAgIEFSTTogZHRzOiBrb2Vsc2NoOiBDb25maWd1cmUgcHVsbC11cCBmb3IgU09GVF9TVyBH
UElPIGtleXMKICAgICAgYXJtNjQ6IGR0czogcmVuZXNhczogcjhhNzc5NTA6IERyb3Agb3BlcmF0
aW5nIHBvaW50cyBhYm92ZSAxLjUgR0h6CgpLaWVyYW4gQmluZ2hhbSAoMyk6CiAgICAgIGFybTY0
OiBkdHM6IHJlbmVzYXM6IGZhbGNvbi1jcHU6IEFkZCBHUCBMRURzCiAgICAgIGFybTY0OiBkdHM6
IHJlbmVzYXM6IHI4YTc3OWEwOiBBZGQgRkNQVkQgc3VwcG9ydAogICAgICBhcm02NDogZHRzOiBy
ZW5lc2FzOiByOGE3NzlhMDogQWRkIFZTUEQgc3VwcG9ydAoKTmlrbGFzIFPDtmRlcmx1bmQgKDEp
OgogICAgICBhcm02NDogZHRzOiByZW5lc2FzOiByOGE3Nzk2MTogQWRkIFZJTiBhbmQgQ1NJLTIg
ZGV2aWNlIG5vZGVzCgpZb3NoaWhpcm8gU2hpbW9kYSAoMSk6CiAgICAgIGFybTY0OiBkdHM6IHJl
bmVzYXM6IHI4YTc3OWEwOiBGaXggUE1VIGludGVycnVwdAoKWXVzdWtlIEdvZGEgKDEpOgogICAg
ICBhcm02NDogZHRzOiByZW5lc2FzOiB1bGNiOiBBZGQgY3B1LXN1cHBseSBwcm9wZXJ0eSB0byBh
NTdfMCBub2RlCgogYXJjaC9hcm0vYm9vdC9kdHMvcjhhNzc5MS1rb2Vsc2NoLmR0cyAgICAgICAg
ICAgICAgfCAgIDggKwogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTUwLmR0c2kg
ICAgICAgICAgfCAgIDUgKwogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTYxLmR0
c2kgICAgICAgICAgfCAzMTQgKysrKysrKysrKysrKysrKysrKystCiAuLi4vYm9vdC9kdHMvcmVu
ZXNhcy9yOGE3NzlhMC1mYWxjb24tY3B1LmR0c2kgICAgICB8ICA3MiArKy0tLQogYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OWEwLWZhbGNvbi5kdHMgICAgfCAgMzkgKystCiBhcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5YTAuZHRzaSAgICAgICAgICB8ICA0MyArKy0K
IGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9zYWx2YXRvci1jb21tb24uZHRzaSAgIHwgICA0
ICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy91bGNiLmR0c2kgICAgICAgICAgICAgIHwg
ICA0ICsKIDggZmlsZXMgY2hhbmdlZCwgNDM1IGluc2VydGlvbnMoKyksIDU0IGRlbGV0aW9ucygt
KQoKR3J7b2V0amUsZWV0aW5nfXMsCgoJCQkJCQlHZWVydAoKLS0KR2VlcnQgVXl0dGVyaG9ldmVu
IC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhr
Lm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkg
Y2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCgkJCQkJCQkg
ICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
