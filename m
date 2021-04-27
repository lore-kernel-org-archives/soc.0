Return-Path: <SRS0=97xB=JY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26439C43460
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Apr 2021 11:32:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D1AC613D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Apr 2021 11:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D1AC613D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DOo67Xv7CpwqlS+3Uxn4XYGMDqI9E1+tEDl2VFBvR8E=; b=nw9vyiFLIXmWMkVhezrTgj2b2u
	icARLIisUTXTJQGZiGiPrU9FFsQPf8y+XaRqvUxBjP3w0hk+toce3WsxLe0yvKcgjxc2pKMkrXQlH
	OVwm10x5wlDLLCNygLcFkptfSNJbiPB0qbdMm+0UCUOtAPE/9TT+UCwIz0RV6WxxeB49sQghvnXH1
	iXZKtFax3UwNWgDVdU8qPT2Ngf8gU3MeQ4WOiBX0aR6l2YcAaMidg0lEThku7d72Q+uIG+WDCdGAF
	m1ne6PbmxsYcGN8CQdXCH3PvQmsqOppjOn3gXmg/tkruSKWh5ppvRDJYK+E0WZJstwfpIGsIltuaU
	p6h5oo2g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbLuo-001VkG-3D; Tue, 27 Apr 2021 11:30:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLul-001Vk6-50
 for linux-arm-kernel@desiato.infradead.org; Tue, 27 Apr 2021 11:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ZhZqbv/hcvZzw5QuLA3nIGn9jjYuzbohlrEyy3cQ5s4=; b=CeVnTZaypgj1mhUl5EsN6aK9qj
 yRl0Q3H4Jp3mdMe+tlQ0Ih//QUfWt/ZWsTX7xnrSd6aNIf4baq/qek8B4VOQ/2ywVd21V/Fva05Pq
 /dsrInPtj6nORI6RRneVuA6RZGP4lyWmeUx264SVs1GzbHKp2Ftp2aLdLaS4sWARtKpm02wjjLsgc
 ZrRYD5Pt+XTRWlZ/IZNAvbgiPu+bFgn7S5GfjEXVyL2o+L8J74If2/9qX9R4rLMqAi3+mCA9J3WVY
 a33rCQ8FmAQjBQbERUn7qtNe+S1QdTsIho16Fr6EAJT200ELJasKP3exQEaVWAVk64x0zXYlV1Zx4
 WYtnUnKQ==;
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLuh-00Ggof-Bw
 for linux-arm-kernel@lists.infradead.org; Tue, 27 Apr 2021 11:30:01 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:91bb:828d:42f8:4e5f])
 by michel.telenet-ops.be with bizsmtp
 id xnVp2400H2ZBlDX06nVpBv; Tue, 27 Apr 2021 13:29:50 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lbLuW-000qtX-Kz; Tue, 27 Apr 2021 13:29:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lbLuW-00G6PU-7s; Tue, 27 Apr 2021 13:29:48 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas ARM DT updates for v5.13 (take three)
Date: Tue, 27 Apr 2021 13:29:43 +0200
Message-ID: <cover.1619522726.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_042959_593717_ABE0663F 
X-CRM114-Status: GOOD (  16.78  )
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
Message-ID: <20210427112943._RaNG5v9egCHL0NWCHEE4NOPKJirpDsDT52KesJ2NYs@z>

CUhpIGFybS1zb2MgZm9sa3MsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDJi
MzVjYTJmZTYwNWY4NWFhMWE1MmM3MTM1NzFiYWYwNGE1ZjQzNGE6CgogIGFybTY0OiBkdHM6IHJl
bmVzYXM6IHVsY2I6IEFkZCBjcHUtc3VwcGx5IHByb3BlcnR5IHRvIGE1N18wIG5vZGUgKDIwMjEt
MDQtMDIgMDk6MjI6MzUgKzAyMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9y
eSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dl
ZXJ0L3JlbmVzYXMtZGV2ZWwuZ2l0IHRhZ3MvcmVuZXNhcy1hcm0tZHQtZm9yLXY1LjEzLXRhZzMK
CmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAwYTk2YzA1OTk1ZWYxMDg1ZjljNWU2YmYw
MDVhMDQ5MTVkZDJlYzZmOgoKICBhcm02NDogZHRzOiByZW5lc2FzOiBBZGQgcG9ydEAwIG5vZGUg
Zm9yIGFsbCBDU0ktMiBub2RlcyB0byBkdHNpICgyMDIxLTA0LTI3IDA5OjA5OjAzICswMjAwKQoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpSZW5lc2FzIEFSTSBEVCB1cGRhdGVzIGZvciB2NS4xMyAodGFrZSB0aHJlZSkKCiAg
LSBGaXggRFQgc2NoZW1hIHZhbGlkYXRpb24gZXJyb3JzIHJlbGF0ZWQgdG8gQ1NJLTIuCgpOb3Rl
IHRoYXQgSSBoYXZlIHJlYmFzZWQgbXkgYnJhbmNoIHRvIGFkZCBMYXVyZW50J3MgcmV2aWV3IHRh
Z3MsIGJ1dCB0aGUKYWN0dWFsIGNvbnRlbnRzIGFyZSBpZGVudGljYWwgdG8gd2hhdCBpcyBpbmNs
dWRlZCBpbiBuZXh0LTIwMjEwNDI3LgoKVGhhbmtzIGZvciBwdWxsaW5nIQoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpOaWts
YXMgU8O2ZGVybHVuZCAoMik6CiAgICAgIGFybTY0OiBkdHM6IHJlbmVzYXM6IGFpc3RhcnZpc2lv
bi1taXBpLWFkYXB0ZXItMi4xOiBGaXggQ1NJNDAgcG9ydHMKICAgICAgYXJtNjQ6IGR0czogcmVu
ZXNhczogQWRkIHBvcnRAMCBub2RlIGZvciBhbGwgQ1NJLTIgbm9kZXMgdG8gZHRzaQoKIC4uLi9o
aWhvcGUtcnpnMi1leC1haXN0YXJ2aXNpb24tbWlwaS1hZGFwdGVyLTIuMS5kdHNpICAgICAgICB8
ICAyIC0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YTEuZHRzaSAgICAgICAg
ICAgICAgICAgICAgfCAgOCArKysrKysrKwogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4
YTc3NGIxLmR0c2kgICAgICAgICAgICAgICAgICAgIHwgIDggKysrKysrKysKIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9yOGE3NzRjMC1lazg3NC1taXBpLTIuMS5kdHMgICAgICB8ICAyICst
CiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YzAuZHRzaSAgICAgICAgICAgICAg
ICAgICAgfCAgNCArKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0ZTEuZHRz
aSAgICAgICAgICAgICAgICAgICAgfCAgOCArKysrKysrKwogYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL3I4YTc3OTUwLmR0c2kgICAgICAgICAgICAgICAgICAgIHwgIDQgKysrKwogYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTUxLmR0c2kgICAgICAgICAgICAgICAgICAgIHwg
MTIgKysrKysrKysrKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NjAuZHRz
aSAgICAgICAgICAgICAgICAgICAgfCAgOCArKysrKysrKwogYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL3I4YTc3OTYxLmR0c2kgICAgICAgICAgICAgICAgICAgIHwgIDggKysrKysrKysKIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk2NS5kdHNpICAgICAgICAgICAgICAgICAg
ICB8ICA4ICsrKysrKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NzAuZHRz
aSAgICAgICAgICAgICAgICAgICAgfCAgNCArKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVz
YXMvcjhhNzc5ODAuZHRzaSAgICAgICAgICAgICAgICAgICAgfCAgOCArKysrKysrKwogYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTkwLWViaXN1LmR0cyAgICAgICAgICAgICAgIHwg
IDIgLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5MC5kdHNpICAgICAgICAg
ICAgICAgICAgICB8ICA0ICsrKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9zYWx2YXRv
ci1jb21tb24uZHRzaSAgICAgICAgICAgICB8ICAzIC0tLQogMTYgZmlsZXMgY2hhbmdlZCwgODUg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCkdye29ldGplLGVldGluZ31zLAoKCQkJCQkJ
R2VlcnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0LgoJCQkJCQkJICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVs
IG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
