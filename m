Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21996371071
	for <soc@lists.linux.dev>; Thu,  8 Oct 2026 05:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791435938; cv=pass; b=EWnilPeeeFC5D2D898H59eFqWHZdybkkozWZouWJCcVL2j4pup49exQMdcrRPkLvh8WxKVtwsjAckwJHOukweuLpHaz4Bfk9hbVIzKYAvSYrRketAllvJYjqxIKIizH+J6GCqPqH7nh3HA/jmGCkzQ0sCJzHikiIFuiibJvYlGg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791435938; c=relaxed/simple;
	bh=FgXnQG+CnfNFToW7GlIT/9ZQnBMRUHu0Btw+ksUjej0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jBB+kled5kijm4m0Pfc3r2u/cHP1hBDw9qwqc544BioPLPfKoVqSXKA/z+xZz3Sf0tBmhLTABwiOfEebi/bnSBtBZVhmOjX2EUvMaJ512E3yHxjFrgCkaVFluXhLOvZ1xlbOtlR8oUo6RSV3zAtom5tjEGV69SsKL4nzWunQgaA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSVN6W3x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKysE+fS; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSVN6W3x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKysE+fS"
Received: by smtp.kernel.org (Postfix)
	id B8ACC1F00899; Thu,  8 Oct 2026 05:05:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1791435936;
	b=2HsuAEtrPGX4H57lORvfHkyZ+BY7K9yQcXMJ3Yv6aYSRLKc2zDMITSrDa9HGPu5rHhgo
	 Y0VatGoEiR4lqc9nR+vsgQjtnzwFUM0IJqztfVdsm0XuIP9G7Y0cNy2x3WZd9A/fKTd1N
	 FB+s0Bh+lJntjL0bZYDSllUEM1LuFgMKc6DouXmNOr2mYxJ6WJlvnO9nlQ5YNRU0FZWxu
	 iEOMqMiUZsR4sX/KbV5lLTTWGEWePUZ0G+9pwnQeXoB0vwCy0q18O14o6+bt5Ka853ZdP
	 7/FPgnPsUnWhIaI49raFv2Is5f/HWxmnAoqdOOuRrbqVRDHM6iXOtUj2E4YM+lgULLw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791435936;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bQqu3dtqoyr6aDyhzeQ4CWAqsjF3txIOH6IaJS+CEvQ=;
	b=QxwiqI8m8RpE3gZb+jw9vZuLPQMhO0HUNA+pBhKF9bcwmvOUTDNv04w5dKhCz0eo5pAx
	 BbD0JBiHkh/inAtS0oiS2bHtJfOECeqAu41nqCAMMrk5bee7XBOvx58Zy++lyNJp/rD+U
	 z2ssJ/zO2BRtaHr4744IOo0R92V6jLLQ3t73yAi+3c/+EJ2z9teyvv1ngvWckPq4ssW7n
	 CPeGOZ6+SFwOKJrVGxFu9XDbEjk8TyzMp0zgX3Bxw4KnghIXKqIYmTGnj3S9OwYzWoJOo
	 1Q/XvE+2hqwzYdSMyu0KbEKvKYZC2QrLogR3mhWt2d21jKWj3lxSPHhqIutl8ip6CMw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bSVN6W3x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AKysE+fS;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 20A3F1F00893
	for <soc@kernel.org>; Thu,  8 Oct 2026 05:05:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bSVN6W3x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AKysE+fS
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 20A3F1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BUbh928477
	for <soc@kernel.org>; Thu, 8 Oct 2026 05:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bQqu3dtqoyr6aDyhzeQ4CWAqsjF3txIOH6IaJS+CEvQ=; b=bSVN6W3xVa3Sz4qX
	c3SSDNvSwbExIIJAp3kqhcBF9Cgit24uSAyrZVjVhQUihmjoCXse6f7fgNqsCqOr
	Vdsm2XIvw9TQ1IM/ulMvk21CA2o1x1B1Lkuz0/Iy/iay8LI2WzVdSyUJjMucuqUN
	5zmMQq40di2qTgMPvBMPpmWFL2pXi17nmjLioNS+eNsezstjl4JYBDx9+Ab4DhSn
	8XfG+nGn2AclO6juaFAqupxRYhJROqSMKfcj1hSL2O849rw0+MjUrlZUcjVy14sP
	nOV43rUTDd5gTcVdlwheSxDeyjcsriQyeVD0Woi946OBryiJnRFKkkY5XIEqkXmS
	fXAROw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2s6fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Thu, 08 Oct 2026 05:05:35 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-677c2db10b1so10621984d50.1
        for <soc@kernel.org>; Wed, 07 Oct 2026 22:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791435932; cv=none;
        d=google.com; s=arc-20260327;
        b=SV815kVt69o9k9rMMBE+7VxUncWFDrPsHHCA2katlR01JgYfC4mgmuIOzziYcngdg2
         QBg5xyLRYcWbiTP9FKIA2/n8YUZJpNXzinb4AAVOkAzLZpLbDF3GYIWHqzGr3avPSfMO
         IGWgIrOkFgzuNKAMl9aub+M5NpgIAT077QTMZSrodQUTSwEGWJBuvAZguKggwn9kzCT0
         kEVwd7EjJrilYMWiKw/Q/X7c1TJyddCLNFv3GTzoosTrch5gFPs2dkkXQG9CdCtJysXk
         /afh5nSZkQfR21kEm7X+a/VHW9a4uCVpFIcJODjZ4raGlLgKuF5oHjglyU1aVFs7kVWb
         JLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bQqu3dtqoyr6aDyhzeQ4CWAqsjF3txIOH6IaJS+CEvQ=;
        fh=XnSFlIhXZsE4q9liKlD4NlZYvb0nSIJPPtjR9kqXNsA=;
        b=CnawgB0oVt3LUhEeVsqDtL/Mcy1ui3gr0wCCFfSQgdUM0m4AwjvXnOsOWmS1Vob0Fq
         8EW1kOHEKT4XC0g+UStonoxYPebVIQV0DTfVxF3U3ZiRGx4+em6++JjS3TwzKww6mv6d
         Zn1nnAjEANCSpYZnxPsemlLwAvDXOPFVjc5T1ga/zIEr25Ni5Y1RFpTeaCQRLxsLEfJn
         q+zNx2Nbt88kXa7nn8OPqhWSSSQ5KUXX6dduYzOpqgpk6/fm4ThaJ24ZJxIfaDhVSGNK
         2F6fWu/5H+/NINex38V+335ggGRyvPKF/vIiIXjWG26pLWta46H2OQYuRqfFNRWeQlIe
         083w==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791435932; x=1792040732; darn=kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bQqu3dtqoyr6aDyhzeQ4CWAqsjF3txIOH6IaJS+CEvQ=;
        b=AKysE+fSgCm9UDRe6MHFRfp5NSsUkMT5AqLnm6KnFHbLlQTL3gPWXK+/45+s8FYvZ5
         ivWmDhRIKPvuQNH5h2vyR5l2AcQnUF4DF27/KX5R9yADSW+w+Y5cJ5mkJ+D/6zTP+v8n
         VJJ8xba17mzH3C+fBhncN4wb8pBlLeY7/j77NkJd+s9sV5PdrAu748YjRZI/zn74yjoQ
         r8t4OoMxPnX9Pt/NVg5Si1pohyKv9+Ko+a5FnMohIVSIiGYZFO4+BfStnvad1raZPyzY
         6ziF6TN7G1FMyzb7OGl5MF+iRaGYw4d2lYXg5jj0eOKdwY0uWFoDbwzYykl2hMvPCpwr
         3oqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791435932; x=1792040732;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bQqu3dtqoyr6aDyhzeQ4CWAqsjF3txIOH6IaJS+CEvQ=;
        b=RALhsK6gLYGeCGGeTymGmBrMzQp3DFqzASDf8BfdYwtWsa9/wW7AXEy7R8TOFtMd0D
         9WEFismh3FLvcc09pWTikZgBKzkW5+KF0SfFCxRH1wl7a2CjSaPsUyF2vFZYsIxbzKRA
         p5LtFI8yRDBYdUIV9xW8C/Okwe0VEKtIiR1NPMJUcmWytfLfDMA0JRIldrBLO1Orj9T7
         DZhraLvshBH85X/hbGMerlWR1YTHy4+MnLYTIkJa9P+yKv/UUjCM1Zr3V3PKEr1h/zPF
         cM5zBTwAK73frEybdEk8EmabR+ymDUKJVgm+3ry/tqXcsnWAgNWsmHYk4fsSKXjfu9Ew
         Hr1w==
X-Forwarded-Encrypted: i=1; AKwUvByN2YBTHa1ZqgqFiCOeRjhmc70Jv/nm5C3iqjKg0OzxzfZSxy8wSMPEqNz+viw+RT8nt7w=@kernel.org
X-Gm-Message-State: AFq9FYIxsnWoWL0dxsIfI7FfUAh3UYYlSAfw6Om7kHOhP4mX+TZO3prw
	qyJZBR9+wPPGaES+rNCZTNYbd49Nh0SlBOHYtqXeedHqBUk9Yzt8uyQeAk+J90kUxxoMqpGZmKD
	PdfwQF/FQ30YaRaEgeD3nDC63AYLwr3QC9obFWl2uH4+W7AuAgndrFpp0vbVLLEwOrSjxmoHSFd
	hdaBWYvaiYrdh1DDaybcY6tpc=
X-Gm-Gg: AYBFou2RvM/QtXLLLaT5DrLY7KnHRifU/Q5nQpDx7PB/YekUiO7KoaEBK1nCEA8vWbc
	3edaBAIWxUlVbRIxZdgg+lkQLDaZFLh80ki5xRSJMq7NXbsPBGGSDNeDplFDCJPDm3WKRa3APKL
	ps8AmBAA1oCx2nHdkPA/5VOPz99hdSgGnMQ70+gfn+b7BPoPP91hOlXdB9CA==
X-Received: by 2002:a05:690e:bc1:b0:675:37b1:931a with SMTP id 956f58d0204a3-6790a0c3183mr2138141d50.12.1791435931736;
        Wed, 07 Oct 2026 22:05:31 -0700 (PDT)
X-Received: by 2002:a05:690e:bc1:b0:675:37b1:931a with SMTP id
 956f58d0204a3-6790a0c3183mr2138134d50.12.1791435931363; Wed, 07 Oct 2026
 22:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922130653.357615-1-andersson@kernel.org> <04be768e-7c38-4ca6-a721-d716947b8708@app.fastmail.com>
In-Reply-To: <04be768e-7c38-4ca6-a721-d716947b8708@app.fastmail.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 10:35:20 +0530
X-Gm-Features: AclHuK8ljan6yYkSfeVW4C8TVoEvGkyXaktUQeB7YpkfdtcH9wriLsHpMlMeAII
Message-ID: <CAGptzHOaNfXhDf7pZ0v=nKGXE6UjwOaw4pacPA4y9Lop8yP37g@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm driver fixes for v7.3
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Andersson <andersson@kernel.org>, arm <arm@kernel.org>,
        soc@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyMCBTYWx0ZWRfX3dXhZlq4vwT4
 Dd6HmXWEQwxw4Syqpm35TvbiN52/MReGe/JGspajnx7jKeAXIdgY/BCgpncLeV/DEr7tn/pmAXc
 dVJpk98F/z6f3T2JFYyv2m95yN8MUH8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyMCBTYWx0ZWRfX9NWl8Ne50xAc
 6EUbriR2a7chazoB46usYYJ8AH/PNfxDzDNzb7o4hhMNGHjWeKLQm5/v1uwu8Uu8uQEbEseLFxC
 uE23468Z8lPeivorwxv5aAxVMNErDNMpkLTqohvqVsWxvjaeYi/+GtfeYftlRmoHMX02c0UJH+9
 cG1p/5ypmHG+lTFNdBPUMcwMBDt0NSfLAirCrP+ePEYQrscjfT4yXfIDGnA5f53ztEkbEq6Hwrv
 6hzP9jGkZbxAuhTeAvEq01KpKmdPfT7OgYisY/b2wFl3F9gfH2H3wrp7b6sfibn7k+qiVziD8OX
 t3GAjh3PgAC0uL7RTgn6T+VfZjX0/BQ5DTTU0QGrRo7LCxLdGAOrzBigImsjL1ddigg156cRb7m
 /eIa0fXlbVhYTJtXv0YyIX6HAWcrRWkxlic6o7LCejhdFi1jChI7PB7Ly8tqBJHFj+9JU8ydgNJ
 NZmYSPinFhTke3XGMcA==
X-Proofpoint-ORIG-GUID: bqibdd5ex4Om5Jc5TF5UK0M3rJX_2KWj
X-Proofpoint-GUID: bqibdd5ex4Om5Jc5TF5UK0M3rJX_2KWj
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac7249f cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=9s7x0yUzlkJ0pj1vzNoA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080020

Hi Arnd,

Coming back to work today after vacation.

On Sat, Oct 3, 2026 at 3:07=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Sep 22, 2026, at 15:06, Bjorn Andersson wrote:
> > The following changes since commit cee9395acd8043be0644b25c34bfa86623f2=
b935:
> > ----------------------------------------------------------------
> > Qualcomm driver fixes for v7.3
> >
> > All clients was migrated from the Qualcomm SCM PAS API to the Qualcomm
> > PAS API in v7.3, remove the now unused direct API.
> >
> > ----------------------------------------------------------------
> > Sumit Garg (1):
> >       firmware: qcom_scm: Remove SCM PAS wrappers
>
> Hi Bjorn and Sumit,
>
> I was running a little behind on the fixes merges, sorry about that.
>
> As it's getting a little late for 7.3, I would suggest skipping this
> one patch as it is a bit large and is a cleanup rather than a fix.
>
> I would instead merge this directly for 7.4 but still take the other
> ones for 7.3. Let me know if there is some reason I missed why this
> needs to be in 7.3 after all.

I agree it's pretty late for v7.3. I am fine for v7.4 if Bjorn is able
to keep the dependencies sorted.

-Sumit
