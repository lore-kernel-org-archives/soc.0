Return-Path: <SRS0=ATq6=PO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B19EC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 20:53:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FB2E60F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 20:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FB2E60F24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vj4FMCvJkqkzfYtTZDqp9eZl87h9eLI0PPG6jvMvK44=; b=t4WQYaINVIOy2i
	TxlMa0kZMqcFOo97QKFozcQEQWUfRZSLbN0GjtjTFbDFgk0mLWzoAl/lnxShrts44JGk2uhsEKWWn
	f9U55ue8HexmorjHM4nMz0VSmAXih2p/Ry79fIhWMUvl8nnkWB1RClOsZIJwaUqVAAFmRFxAzflnX
	wQiqpQvtmCqisUurt/ptqaF+dUDB+llmIROHod63vT40s6A56ttoQGuhgmAths7BD26ye/1jK8XIr
	l5p8cd61StwwGKXejnegJx3CqCn37S593HEUElYARtiYsVdCrbEt1DTEK0qY0BMdb2aCN56Y/8hiN
	TiTqxEsUsb7gSEV4bFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfTQB-0033Hh-Mr; Tue, 26 Oct 2021 20:51:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfTQ7-0033HH-Qk
 for linux-arm-kernel@lists.infradead.org; Tue, 26 Oct 2021 20:51:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E69E860F02
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 26 Oct 2021 20:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635281502;
 bh=X0s+TPT9qDOVyR+RmgrWax7b3R4tccWt2MJGyvfXTHw=;
 h=From:Date:Subject:To:List-Id:Cc:From;
 b=HedmHfnWXaotTpGuG5H7NuObQmBdklBsiRUENPlpfcC/Z0VvE9eUZ89PQKM4aJEc6
 9FTQZTK9TmEWi1zvOD304SggsEoTVwlxoxDPr5MnBLACh9jOjBDvrzgkZyM85J5m+q
 zpVvDtYKfTQcDIB700Of2U+DEytqhrbsDEKlSgX4u7F67ganGQweAcWfitRhVen8ku
 768jjNdFtXaKXamd6lxLB1hZkari/j9D+DmGOVY/F1elMt67hdbmnzCeYmyaCHHALX
 9MADzEOdNNJ6y7s6y7T7VeJkeqGe+Vda6hX4ooyRPjAB5xJfYZCqu9n26cGkvdacBE
 tDXx32kQ6JYLQ==
Received: by mail-wm1-f45.google.com with SMTP id
 131-20020a1c0489000000b0032cca9883b5so3062976wme.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 26 Oct 2021 13:51:42 -0700 (PDT)
X-Gm-Message-State: AOAM531m4WkLvYCU/x1q0GykOyhawW6mVpLH3BZm3kTcjlUldIk9ovi/
 sbgl3f9CSsReH8uSNJfx9uMp+jyXGnxl0Rjq8Sg=
X-Google-Smtp-Source: ABdhPJzYsVeNX77z4D8mHdqKcPkbA/a3rFsNHJBT+cgWffAPjYbG1CzllW4KV87bN/SidJu8nTq5cmOR6scKlGk9oRY=
X-Received: by 2002:a05:600c:1912:: with SMTP id
 j18mr1077882wmq.173.1635281501478; 
 Tue, 26 Oct 2021 13:51:41 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 26 Oct 2021 22:51:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1VnXSFeb5EVAG4MYP7P3bTE=Tyn6uKk_2OcJ0C69suSQ@mail.gmail.com>
Message-ID: <CAK8P3a1VnXSFeb5EVAG4MYP7P3bTE=Tyn6uKk_2OcJ0C69suSQ@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for 5.15, part 3
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_135143_954421_068E5AB9 
X-CRM114-Status: GOOD (  12.33  )
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
Message-ID: <20211026205125.wvtioglD8C72k2tPXdB26_KZ1XIRoZBJKcO8XBULt6I@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA1MTlkODE5NTZlZTI3N2I0NDE5Yzcy
M2FkZmIxNTQ2MDNjMjU2NWJhOgoKICBMaW51eCA1LjE1LXJjNiAoMjAyMS0xMC0xNyAyMDowMDox
MyAtMTAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc29jL3NvYy5naXQKdGFn
cy9hcm0tc29jLWZpeGVzLTUuMTUtMwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDA1
ZDVkYTNjYjExYzkxYzM5ZTYwNzA2NmQzMzEzYTZjZTYyMTc5NmE6CgogIE1BSU5UQUlORVJTOiBB
ZGQgbWFpbnRhaW5lcnMgZm9yIERIQ09NIGkuTVg2IGFuZCBESENPTS9ESENPUgpTVE0zMk1QMSAo
MjAyMS0xMC0yNiAxNzoxNDozNyArMDIwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQVJNOiBTb0MgZml4ZXMgZm9yIDUu
MTUsIHBhcnQgMwoKT25lIGxhc3Qgc2V0IG9mIHNtYWxsIGZpeGVzIGZvciB0aGUgc29jIHRyZWU6
CgogLSBJbmNvcnJlY3QgZXRoZXJuZXQgcGh5IHNldHRpbmdzIGZvdW5kIG9uIGkubXggYW5kCiAg
IGFsbHdpbm5lciBwbGF0Zm9ybXMKCiAtIGEgcmV2ZXJ0IGZvciBhIFF1YWxjb21tIERUIGNoYW5n
ZSB0aGF0IGNhdXNlZCBhIGJvb3QKICAgcmVncmVzc2lvbgoKIC0gZm91ciBwYXRjaGVzIGZvciBp
bmNvcnJlY3Qgc2V0dGluZ3MgaW4gaS5NWCBEVCBmaWxlcwoKIC0gbmV3IE1BSU5UQUlORVIgZmls
ZSBlbnRyaWVzIGZvciBkaGNvbSBib2FyZHMKCiAtIGEgS2NvbmZpZyBmaXggZm9yIGEgcmVzZXQg
ZHJpdmVyIHRoYXQgYmVjYW1lIHVuc2VsZWN0YWJsZQoKIC0gdGhyZWUgbW9yZSBjb2RlIGNoYW5n
ZXMgZm9yIGJ1Z3MgaW4gcmVzZXQgZHJpdmVycwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBbWl0IFB1bmRpciAoMSk6CiAg
ICAgIFJldmVydCAiYXJtNjQ6IGR0czogcWNvbTogc204MjUwOiByZW1vdmUgYnVzIGNsb2NrIGZy
b20gdGhlIG1kc3MKbm9kZSBmb3Igc204MjUwIHRhcmdldCIKCkFybmQgQmVyZ21hbm4gKDQpOgog
ICAgICBNZXJnZSB0YWcgJ2lteC1maXhlcy01LjE1LTQnIG9mCmdpdDovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zaGF3bmd1by9saW51eCBpbnRvCmFybS9maXhlcwog
ICAgICBNZXJnZSB0YWcgJ3N1bnhpLWZpeGVzLWZvci01LjE1LTEnIG9mCmdpdDovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdW54aS9saW51eCBpbnRvCmFybS9maXhl
cwogICAgICBNZXJnZSB0YWcgJ3Jlc2V0LWZpeGVzLWZvci12NS4xNScgb2YKZ2l0Oi8vZ2l0LnBl
bmd1dHJvbml4LmRlL3B6YS9saW51eCBpbnRvIGFybS9maXhlcwogICAgICBNZXJnZSB0YWcgJ3Fj
b20tYXJtNjQtZml4ZXMtZm9yLTUuMTUtMicgb2YKZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3Fjb20vbGludXggaW50bwphcm0vZml4ZXMKCkJhc3RpZW4gUm91
Y2FyacOocyAoMSk6CiAgICAgIEFSTTogZHRzOiBzdW43aTogQTIwLW9saW51eGluby1saW1lMjog
Rml4IGV0aGVybmV0IHBoeS1tb2RlCgpDaHJpc3RvcGggTmllZGVybWFpZXIgKDEpOgogICAgICBN
QUlOVEFJTkVSUzogQWRkIG1haW50YWluZXJzIGZvciBESENPTSBpLk1YNiBhbmQgREhDT00vREhD
T1IgU1RNMzJNUDEKCkNsw6ltZW50IELFk3NjaCAoMSk6CiAgICAgIGFybTY0OiBkdHM6IGFsbHdp
bm5lcjogaDU6IE5hbm9QSSBOZW8gMjogRml4IGV0aGVybmV0IG5vZGUKCkZyaWVkZXIgU2NocmVt
cGYgKDUpOgogICAgICBhcm02NDogZHRzOiBpbXg4bW0ta29udHJvbjogTWFrZSBzdXJlIFNPQyBh
bmQgRFJBTSBzdXBwbHkKdm9sdGFnZXMgYXJlIGNvcnJlY3QKICAgICAgYXJtNjQ6IGR0czogaW14
OG1tLWtvbnRyb246IFNldCBsb3dlciBsaW1pdCBvZiBWRERfU05WUyB0byA4MDAgbVYKICAgICAg
YXJtNjQ6IGR0czogaW14OG1tLWtvbnRyb246IEZpeCBwb2xhcml0eSBvZiByZWdfcnN0X2V0aDIK
ICAgICAgYXJtNjQ6IGR0czogaW14OG1tLWtvbnRyb246IEZpeCBDQU4gU1BJIGNsb2NrIGZyZXF1
ZW5jeQogICAgICBhcm02NDogZHRzOiBpbXg4bW0ta29udHJvbjogRml4IGNvbm5lY3Rpb24gdHlw
ZSBmb3IgVlNDODUzMSBSR01JSSBQSFkKCkdlZXJ0IFV5dHRlcmhvZXZlbiAoMSk6CiAgICAgIHJl
c2V0OiBwaXN0YWNoaW86IFJlLWVuYWJsZSBkcml2ZXIgc2VsZWN0aW9uCgpKaW0gUXVpbmxhbiAo
MSk6CiAgICAgIHJlc2V0OiBicmNtc3RiLXJlc2NhbDogZml4IGluY29ycmVjdCBwb2xhcml0eSBv
ZiBzdGF0dXMgYml0CgpNaWtrbyBQZXJ0dHVuZW4gKDEpOgogICAgICByZXNldDogdGVncmEtYnBt
cDogSGFuZGxlIGVycm9ycyBpbiBCUE1QIHJlc3BvbnNlCgpQYXdlxYIgQW5pa2llbCAoMSk6CiAg
ICAgIHJlc2V0OiBzb2NmcGdhOiBhZGQgZW1wdHkgZHJpdmVyIGFsbG93aW5nIGNvbnN1bWVycyB0
byBwcm9iZQoKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMTMgKysrKysrKysrKysKIGFyY2gvYXJtL2Jvb3QvZHRzL3N1bjdpLWEyMC1vbGludXhp
bm8tbGltZTIuZHRzICAgIHwgIDIgKy0KIC4uLi9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg1
LW5hbm9waS1uZW8yLmR0cyAgIHwgIDIgKy0KIC4uLi9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1t
LWtvbnRyb24tbjgwMXgtcy5kdHMgIHwgIDggKysrKy0tLQogLi4uL2R0cy9mcmVlc2NhbGUvaW14
OG1tLWtvbnRyb24tbjgwMXgtc29tLmR0c2kgICAgfCAgOCArKysrLS0tCiBhcmNoL2FybTY0L2Jv
b3QvZHRzL3Fjb20vc204MjUwLmR0c2kgICAgICAgICAgICAgICB8ICAzICsrLQogZHJpdmVycy9y
ZXNldC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArKy0tCiBkcml2
ZXJzL3Jlc2V0L3Jlc2V0LWJyY21zdGItcmVzY2FsLmMgICAgICAgICAgICAgICB8ICAyICstCiBk
cml2ZXJzL3Jlc2V0L3Jlc2V0LXNvY2ZwZ2EuYyAgICAgICAgICAgICAgICAgICAgICB8IDI2ICsr
KysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvcmVzZXQvdGVncmEvcmVzZXQtYnBtcC5jICAg
ICAgICAgICAgICAgICAgIHwgIDkgKysrKysrKy0KIDEwIGZpbGVzIGNoYW5nZWQsIDY0IGluc2Vy
dGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
