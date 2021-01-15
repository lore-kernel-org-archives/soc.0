Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A52C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 09:48:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 336D9235F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 09:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 336D9235F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=te0Ih2mWOXaAyClZ5qOWu8sRYl9fKMTndQTMmBuFgik=; b=nas2FNOS2FTvi3px7MYLmJyZ/
	d0NmpBpYt6RRCdiABRsY/9G4cd9SufRU8zO2Rpy5neL6yBAevtJhQXcLchedKjl5qSUxiyCdnO3bq
	dewv+kZoQMHrfLoFWcvPYBrIE+v1WoBeiRjYJNDnd5Ot7q53I0l3JTpPU9y0IRUswjh0DQMGyT7U0
	SXMa6fenGsRxSpho8PAR0buhy2IEStlHNSISYcuNGotXZg4Ti0Y92LGDBOL6NBTucGHgjCk9CDOn5
	YIlGv/Co5b8Mqvwzu5Y+H3KmCMjVbVyVfmtMrL3Ngv7/qGa/7tJIqhoPcYFTmejbHZGfDlVVlPLng
	ZWAOmPcoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Lgt-0005z1-Hu; Fri, 15 Jan 2021 09:46:47 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0LgY-0005sy-Tg
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 09:46:29 +0000
Received: from ramsan.of.borg ([84.195.186.194])
 by michel.telenet-ops.be with bizsmtp
 id GxmM2400K4C55Sk06xmMMa; Fri, 15 Jan 2021 10:46:21 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1l0LgT-003iyG-4y; Fri, 15 Jan 2021 10:46:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1l0LgS-009nD1-HR; Fri, 15 Jan 2021 10:46:20 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Subject: [GIT PULL 1/2] Renesas ARM DT updates for v5.12
Date: Fri, 15 Jan 2021 10:46:09 +0100
Message-ID: <20210115094610.2334058-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115094610.2334058-1-geert+renesas@glider.be>
References: <20210115094610.2334058-1-geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_044627_116417_EA491ED8 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115094609.EpJBlk3OTRLfu_XyYhtA77znudWhGyIUfC_ZmtnCPWo@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA1YzhmZTU4M2NjZTU0MmFhMGI4NGFk
YzkzOWNlODUyOTNkZTM2ZTVlOgoKICBMaW51eCA1LjExLXJjMSAoMjAyMC0xMi0yNyAxNTozMDoy
MiAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZ2VlcnQvcmVuZXNhcy1k
ZXZlbC5naXQgdGFncy9yZW5lc2FzLWFybS1kdC1mb3ItdjUuMTItdGFnMQoKZm9yIHlvdSB0byBm
ZXRjaCBjaGFuZ2VzIHVwIHRvIDFmNDQ0OWUxMmM1YzY2ODJhNmY0ZjhkYmM3Mjg4YzE5YzFjODQ0
ZjE6CgogIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI4YTc3OWEwOiBBZGQgU1lTLURNQUMgbm9kZXMg
KDIwMjEtMDEtMTQgMTI6MTM6MDAgKzAxMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClJlbmVzYXMgQVJNIERUIHVwZGF0
ZXMgZm9yIHY1LjEyCgogIC0gVGltZXIgKENNVC9UTVUpIHN1cHBvcnQgZm9yIFItQ2FyIEdlbjMg
U29DcywKICAtIFdhdGNoZG9nIChSV0RUKSwgcGluY29udHJvbCAoUEZDKSwgR1BJTywgYW5kIERN
QSAoU1lTLURNQUMpIHN1cHBvcnQKICAgIGZvciB0aGUgUi1DYXIgVjNVIFNvQywKICAtIFVTQjIg
Y2xvY2sgc2VsZWN0b3IgYW5kIFNQSSBNdWx0aSBJL08gQnVzIENvbnRyb2xsZXIgKFJQQy1JRikK
ICAgIHN1cHBvcnQgZm9yIFJaL0cyIFNvQ3MsCiAgLSBTdXBwb3J0IGZvciB0aGUgQmVhY29uIEVt
YmVkZGVkV29ya3MgUlovRzJIIGFuZCBSWi9HMk4ga2l0cywKICAtIFZhcmlvdXMgZml4ZXMgYW5k
IGltcHJvdmVtZW50cy4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQWRhbSBGb3JkICgxNyk6CiAgICAgIGFybTY0OiBkdHM6
IHJlbmVzYXM6IGJlYWNvbiBraXQ6IEZpeCBjaG9wcHkgQmx1ZXRvb3RoIEF1ZGlvCiAgICAgIGFy
bTY0OiBkdHM6IHJlbmVzYXM6IGJlYWNvbiBraXQ6IFJlbW92ZSB1bm5lY2Vzc2FyeSBub2Rlcwog
ICAgICBhcm02NDogZHRzOiByZW5lc2FzOiBiZWFjb246IEZpeCBhdWRpby0xLjhWIHBpbiBlbmFi
bGUKICAgICAgYXJtNjQ6IGR0czogcmVuZXNhczogYmVhY29uOiBGaXggTFZEUyBQV00gQmFja2xp
Z2h0CiAgICAgIGFybTY0OiBkdHM6IHJlbmVzYXM6IGJlYWNvbjogRml4IFJHQiBEaXNwbGF5IFBX
TSBCYWNrbGlnaHQKICAgICAgYXJtNjQ6IGR0czogcmVuZXNhczogYmVhY29uOiBEb24ndCBtYWtl
IHZjY3Ffc2RoaTAgYWx3YXlzIG9uCiAgICAgIGFybTY0OiBkdHM6IHJlbmVzYXM6IGJlYWNvbjog
RW5hYmxlIFNQSQogICAgICBhcm02NDogZHRzOiByZW5lc2FzOiBiZWFjb246IENvcnJlY3QgSTJD
IGJ1cyBzcGVlZHMKICAgICAgYXJtNjQ6IGR0czogcmVuZXNhczogYmVhY29uOiBDb25maWd1cmUg
cHJvZ3JhbW1hYmxlIGNsb2NrcwogICAgICBhcm02NDogZHRzOiByZW5lc2FzOiBiZWFjb24ga2l0
OiBGaXggQXVkaW8gQ2xvY2sgc291cmNlcwogICAgICBhcm02NDogZHRzOiByZW5lc2FzOiBiZWFj
b246IENvbmZpZ3VyZSBBdWRpbyBDT0RFQyBjbG9ja3MKICAgICAgYXJtNjQ6IGR0czogcmVuZXNh
czogYmVhY29uOiBCZXR0ZXIgZGVzY3JpYmUga2V5cwogICAgICBhcm02NDogZHRzOiByZW5lc2Fz
OiBiZWFjb24tcnpnMm0ta2l0OiBSZWFycmFuZ2UgU29DIHVuaXF1ZSBmdW5jdGlvbnMKICAgICAg
YXJtNjQ6IGR0czogcmVuZXNhczogcjhhNzc0YjE6IEludHJvZHVjZSBiZWFjb24tcnpnMm4ta2l0
CiAgICAgIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI4YTc3NGUxOiBJbnRyb2R1Y2UgYmVhY29uLXJ6
ZzJoLWtpdAogICAgICBhcm02NDogZHRzOiByZW5lc2FzOiByemcyOiBBZGQgdXNiMl9jbGtzZWwg
dG8gUlovRzIgTS9OL0gKICAgICAgYXJtNjQ6IGR0czogcmVuZXNhczogcnpnMjogQWRkIFJQQy1J
RiBTdXBwb3J0CgpHZWVydCBVeXR0ZXJob2V2ZW4gKDIpOgogICAgICBhcm02NDogZHRzOiByZW5l
c2FzOiByOGE3NzlhMDogQWRkIEdQSU8gbm9kZXMKICAgICAgYXJtNjQ6IGR0czogcmVuZXNhczog
cjhhNzc5YTA6IEFkZCBTWVMtRE1BQyBub2RlcwoKSG9hbmcgVm8gKDIpOgogICAgICBhcm02NDog
ZHRzOiByZW5lc2FzOiByOGE3NzlhMDogQWRkIFJXRFQgbm9kZQogICAgICBhcm02NDogZHRzOiBy
ZW5lc2FzOiBmYWxjb246IEVuYWJsZSB3YXRjaGRvZyB0aW1lcgoKTmlrbGFzIFPDtmRlcmx1bmQg
KDIpOgogICAgICBhcm02NDogZHRzOiByZW5lc2FzOiByY2FyLWdlbjM6IEFkZCBtaXNzaW5nIENN
VCBub2RlcwogICAgICBhcm02NDogZHRzOiByZW5lc2FzOiByY2FyLWdlbjM6IEFkZCBtaXNzaW5n
IFRNVSBub2RlcwoKVWxyaWNoIEhlY2h0ICgxKToKICAgICAgYXJtNjQ6IGR0czogcmVuZXNhczog
cjhhNzc5YTA6IEFkZCBwaW5jdHJsIGRldmljZSBub2RlCgogYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL01ha2VmaWxlICAgICAgICAgICAgICAgfCAgIDIgKwogLi4uL2Jvb3QvZHRzL3JlbmVz
YXMvYmVhY29uLXJlbmVzb20tYmFzZWJvYXJkLmR0c2kgfCAxMzcgKysrKysrKy0tLS0tLQogLi4u
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvYmVhY29uLXJlbmVzb20tc29tLmR0c2kgfCAgNDMgKyst
LQogLi4uL2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YTEtYmVhY29uLXJ6ZzJtLWtpdC5kdHMgfCAg
NDEgKysrKwogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGExLmR0c2kgICAgICAg
ICAgfCAgMzIgKysrCiAuLi4vYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRiMS1iZWFjb24tcnpnMm4t
a2l0LmR0cyB8ICA2NiArKysrKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0
YjEuZHRzaSAgICAgICAgICB8ICAzMiArKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9y
OGE3NzRjMC5kdHNpICAgICAgICAgIHwgIDE3ICsrCiAuLi4vYm9vdC9kdHMvcmVuZXNhcy9yOGE3
NzRlMS1iZWFjb24tcnpnMmgta2l0LmR0cyB8ICA3MSArKysrKysrCiBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcjhhNzc0ZTEuZHRzaSAgICAgICAgICB8ICAzMiArKysKIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk1MS5kdHNpICAgICAgICAgIHwgIDY1ICsrKysrKwogYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTYwLmR0c2kgICAgICAgICAgfCAgNjUgKysr
KysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NjEuZHRzaSAgICAgICAgICB8
IDEzNSArKysrKysrKysrKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NjUu
ZHRzaSAgICAgICAgICB8ICA2NSArKysrKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9y
OGE3Nzk5MC5kdHNpICAgICAgICAgIHwgIDY1ICsrKysrKwogYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL3I4YTc3OTk1LmR0c2kgICAgICAgICAgfCAxMzUgKysrKysrKysrKysrKwogYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OWEwLWZhbGNvbi5kdHMgICAgfCAgIDUgKwogYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OWEwLmR0c2kgICAgICAgICAgfCAyMTcgKysr
KysrKysrKysrKysrKysrKysrCiAxOCBmaWxlcyBjaGFuZ2VkLCAxMTQwIGluc2VydGlvbnMoKyks
IDg1IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMv
cmVuZXNhcy9yOGE3NzRiMS1iZWFjb24tcnpnMm4ta2l0LmR0cwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRlMS1iZWFjb24tcnpnMmgta2l0LmR0
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJt
LWtlcm5lbAo=
