Return-Path: <SRS0=Fj/g=HC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4445DC433E6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Jan 2021 22:19:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 014CD64E29
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Jan 2021 22:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 014CD64E29
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZUjub5qUg8rs6xuk/npall4C8UAkf5ijR3E4krEUfVg=; b=YjLFApAHYXtTF7EI6Sk2Pf+OT
	Gkpx5hSx7do+AZP+gGRje/RxDroV9Lp9y8KqBTAdXHSsAHzCN91m2aG0pnRyZFeeM/VJfzYmghVce
	WRFQpZ0nvpexZRM2D5KALhUOjbhpaTJGiCwmqHd18Km7vfLvEPK4h+CvyGAXwCugjHiMPP7T/kC7l
	bGp2wW17ryDhxc/hp2HFRaSLvqD0UnNzlwSwLKdERy8y3KIKY1SJqVvFgr2Vhoz4+6J44Xn17S42J
	lzp1JBbomkofo9ySF3FfYQ1eWgittVBvpd7C4AT36CLYMEJyTPFrX5zQjkDBjLcVFAwczBrHyQXJi
	byA1I9YTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6L31-0000zN-Nt; Sun, 31 Jan 2021 22:18:23 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6L2n-0000wQ-Re
 for linux-arm-kernel@lists.infradead.org; Sun, 31 Jan 2021 22:18:10 +0000
Received: by mail-pg1-x52b.google.com with SMTP id s23so9445337pgh.11
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 31 Jan 2021 14:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iyBcxz1AdCnAU2zDHjpyBeoUWMJV2JNVfPF+J8J9nbs=;
 b=sMjYBWQ+SHyOHtaUUhZM8uoEBphLBxTMJCneGzh7XLBx9+g5hsmXM/W8tPQRKrCmaU
 hEVsWBhb7AkFMVf0RRY8iUOozLdeSuhjvr8xuC71vImP3OarhZKWIuXcnktdLn/WERWR
 Azy7st10Lt5adps9OURI5mwjNzF3Mwd6SMeWfaa5TWGCNUk4/Ykmm2xgmvN1fnTmXQzI
 hI+QMBN62K8v8uT++rmwVwCt703cC4DgqY9xRKJagW6m6ZFwEHj5aqyaPiyok3qxJ8Mm
 G6H3OfzRhX4nzQovKBiaZMuiVdCapGM1BIoBy9gG9oXhZHm8V67MldP2CxZmoQoDVJgE
 ggnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iyBcxz1AdCnAU2zDHjpyBeoUWMJV2JNVfPF+J8J9nbs=;
 b=tFhQE96VHnLQTBG+oN21JfHqHikHnVawQXETupDWkpKZvE8m0kcIbfqSqE4da42ynQ
 omjcTf13fu+Roc/3r39mcrKYD9Gyk6EGc6a9E38qWNw2zQGQQsMMc6xRKYbWaQk3MjdL
 IppCMVABJDypllb7gP9NGT77lrrpoY2gBQ+0fgEymKFSBvntUF7/dhXdKr+06BeAcLu+
 QdrXJzc+DNobDw+WImyKvrWXG+XzIGR7UQQKnwk6IyTtxuvMLlLLvNwc4QBTXN9aGHj4
 /0yRvWgQkTfxo2O+kV4kI4VFjLV20Tae5OWm6bc5Fpwk8SfSK2OU7Hf8YHjdngntPFpj
 4b2Q==
X-Gm-Message-State: AOAM5320q+bhWPV8l+Kb7hSbVTgHoG2xnkkXy3GwuIxzI8V6hNUrd4Bw
 nXVcrjPdVRWeSFMiq8fR+I0=
X-Google-Smtp-Source: ABdhPJyHDVMURxHBhEzSVrY2Yyb4BwtBvMYt7WlcytcBnBNSspJv5KAxC3OEd/HXdX9NO2tA3+/okw==
X-Received: by 2002:aa7:93a2:0:b029:1bf:23a3:a945 with SMTP id
 x2-20020aa793a20000b02901bf23a3a945mr13481777pff.70.1612131487631; 
 Sun, 31 Jan 2021 14:18:07 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id a4sm15512177pfg.41.2021.01.31.14.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 14:18:06 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 4/6] Broadcom devicetree-arm64 changes for 5.12
Date: Sun, 31 Jan 2021 14:17:18 -0800
Message-ID: <20210131221721.685974-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210131221721.685974-1-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_171809_951347_E976DBA5 
X-CRM114-Status: GOOD (  12.92  )
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
Cc: Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 arnd@arndb.de, Scott Branden <scott.branden@broadcom.com>, khilman@kernel.org,
 olof@lixom.net, Ray Jui <ray.jui@broadcom.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210131221718._jZ_l80ieiM-8GPP3_M1UYRGH0GHw_g-U9Pyw87bAP8@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA1YzhmZTU4M2NjZTU0MmFhMGI4NGFk
YzkzOWNlODUyOTNkZTM2ZTVlOgoKICBMaW51eCA1LjExLXJjMSAoMjAyMC0xMi0yNyAxNTozMDoy
MiAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRw
czovL2dpdGh1Yi5jb20vQnJvYWRjb20vc3RibGludXguZ2l0IHRhZ3MvYXJtLXNvYy9mb3ItNS4x
Mi9kZXZpY2V0cmVlLWFybTY0Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZmUxMTk5
Nzc2NzdlN2RkM2RkYjRhYjUyNjc4YjQ2YjgwNDE0OGViNToKCiAgYXJtNjQ6IGR0czogYnJvYWRj
b206IFJlbW92ZSBTQVRBIGZyb20gU3RpbmdyYXkgKDIwMjEtMDEtMjYgMTY6MjY6MzMgLTA4MDAp
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tClRoaXMgcHVsbCByZXF1ZXN0IGNvbnRhaW5zIEJyb2FkY29tIEFSTTY0LWJhc2Vk
IFNvQ3MgRGV2aWNlIFRyZWUgY2hhbmdlcwpmb3IgNS4xMiBwbGVhc2UgcHVsbCB0aGUgZm9sbG93
aW5nOgoKLSBSYWZhbCBjb250aW51ZXMgdG8gYWRkIHN1cHBvcnQgZm9yIHRoZSA0OTA2LzQ5MDgg
U29DIGZhbWlseSBhbmQgYWRkcwogIGEgRGV2aWNlIFRyZWUgZm9yIHRoZSBOZXRnZWFyIFI4MDAw
UCByb3V0ZXIgKDQ5MDYtYmFzZWQpLCBkZXNjcmliZXMKICB0aGUgTkFORCBjb250cm9sbGVyIG9m
IHRoZSA0OTA4IG1vcmUgYXBwcm9wcmlhdGVseSAoYmFzZWQgb24gdGhlIG9sZGVyCiAgNjMxMzgg
RFNMIFNvQyksIGRlc2NyaWJlcyB0aGUgNDkwOCBQQ0llIHJlc2V0IGNvbnRyb2xsZXIsIGludGVy
bmFsCiAgRXRoZXJuZXQgc3dpdGNoIChTdGFyZmlnaHRlciAyIHN3aXRjaCkgYW5kIGZpbmFsbHkg
dGhlIFBvd2VyCiAgTWFuYWdlbWVudCBCdXMgKFBNQikKCi0gU2NvdHQgcmVtb3ZlcyBhbGwgb2Yg
dGhlIFNBVEEtcmVsYXRlZCBEZXZpY2UgVHJlZSBub2RlcyBzaW5jZSBTQVRBCiAgaXMgdW51c2Vk
IG9uIHRoZSBTdGluZ3JheSBwcm9kdWN0IGxpbmUKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUmFmYcWCIE1pxYJlY2tpICg2
KToKICAgICAgZHQtYmluZGluZ3M6IGFybTogYmNtOiBkb2N1bWVudCBOZXRnZWFyIFI4MDAwUCBi
aW5kaW5nCiAgICAgIGFybTY0OiBkdHM6IGJyb2FkY29tOiBiY200OTA4OiBhZGQgQkNNNDkwNiBO
ZXRnZWFyIFI4MDAwUCBEVFMgZmlsZXMKICAgICAgYXJtNjQ6IGR0czogYnJvYWRjb206IGJjbTQ5
MDg6IHVzZSBwcm9wZXIgTkFORCBiaW5kaW5nCiAgICAgIGFybTY0OiBkdHM6IGJyb2FkY29tOiBi
Y200OTA4OiBkZXNjcmliZSBQQ0llIHJlc2V0IGNvbnRyb2xsZXIKICAgICAgYXJtNjQ6IGR0czog
YnJvYWRjb206IGJjbTQ5MDg6IGRlc2NyaWJlIGludGVybmFsIHN3aXRjaAogICAgICBhcm02NDog
ZHRzOiBicm9hZGNvbTogYmNtNDkwODogZGVzY3JpYmUgUE1CIGJsb2NrCgpTY290dCBCcmFuZGVu
ICgxKToKICAgICAgYXJtNjQ6IGR0czogYnJvYWRjb206IFJlbW92ZSBTQVRBIGZyb20gU3Rpbmdy
YXkKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYmNtL2JyY20sYmNtNDkwOC55YW1sICB8
ICAgMiArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2Jyb2FkY29tL2JjbTQ5MDgvTWFrZWZpbGUgICAg
ICB8ICAgMSArCiAuLi4vYnJvYWRjb20vYmNtNDkwOC9iY200OTA2LW5ldGdlYXItcjgwMDBwLmR0
cyAgICB8ICA1MiArKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2Jyb2FkY29tL2JjbTQ5MDgvYmNt
NDkwNi5kdHNpICB8ICAxOCArKwogLi4uL2Jyb2FkY29tL2JjbTQ5MDgvYmNtNDkwOC1hc3VzLWd0
LWFjNTMwMC5kdHMgICAgfCAgNTEgKysrKwogYXJjaC9hcm02NC9ib290L2R0cy9icm9hZGNvbS9i
Y200OTA4L2JjbTQ5MDguZHRzaSAgfCAxMTcgKysrKysrKystCiAuLi4vYm9vdC9kdHMvYnJvYWRj
b20vc3RpbmdyYXkvYmNtOTU4NzQyLWJhc2UuZHRzaSB8ICA2NCAtLS0tLQogLi4uL2Jvb3QvZHRz
L2Jyb2FkY29tL3N0aW5ncmF5L3N0aW5ncmF5LXNhdGEuZHRzaSAgfCAyNzggLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAuLi4vYXJtNjQvYm9vdC9kdHMvYnJvYWRjb20vc3RpbmdyYXkvc3RpbmdyYXku
ZHRzaSB8ICAgNyAtCiA5IGZpbGVzIGNoYW5nZWQsIDIzOSBpbnNlcnRpb25zKCspLCAzNTEgZGVs
ZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9icm9hZGNv
bS9iY200OTA4L2JjbTQ5MDYtbmV0Z2Vhci1yODAwMHAuZHRzCiBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC9hcm02NC9ib290L2R0cy9icm9hZGNvbS9iY200OTA4L2JjbTQ5MDYuZHRzaQogZGVsZXRl
IG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvYnJvYWRjb20vc3RpbmdyYXkvc3Rpbmdy
YXktc2F0YS5kdHNpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCg==
